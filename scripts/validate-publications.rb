#!/usr/bin/env ruby
# Validate the single publication metadata source. Ruby standard library only.
require 'yaml'
require 'date'
require 'uri'
require 'set'

root = File.expand_path('..', __dir__)
config = YAML.safe_load_file(File.join(root, '_config.yml'), aliases: true)
categories = config.fetch('publication_category').keys
errors = []
warnings = []
identifiers = {}
permalinks = Set.new
records = []
Dir[File.join(root, '_publications', '*.md')].sort.each do |path|
  name = File.basename(path)
  text = File.read(path)
  front = text.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  unless front
    errors << "#{name}: missing YAML front matter"
    next
  end
  begin
    data = YAML.safe_load(front[1], permitted_classes: [Date, Time], aliases: false)
    unless data.is_a?(Hash)
      errors << "#{name}: front matter must be a mapping"
      next
    end
    %w[title collection category publication_type permalink date publication_date authors venue description metadata_sources].each do |field|
      value = data[field]
      errors << "#{name}: missing #{field}" if value.nil? || value.respond_to?(:empty?) && value.empty?
    end
    errors << "#{name}: invalid category" unless categories.include?(data['category'])
    errors << "#{name}: collection must be publications" unless data['collection'] == 'publications'
    errors << "#{name}: legacy citation duplicates structured metadata" if data.key?('citation')
    authors = data['authors']
    unless authors.is_a?(Array) && authors.all? { |author| author.is_a?(String) && !author.strip.empty? && !author.match?(/et al\.?/i) }
      errors << "#{name}: authors must be an ordered list without et al."
    end
    errors << "#{name}: duplicate author" if authors.is_a?(Array) && authors.uniq.length != authors.length
    unless Array(authors).include?('Alexis Castel') || Array(authors).include?('A. Castel')
      errors << "#{name}: Alexis Castel is missing from the author list"
    end
    date = data['publication_date'].to_s
    begin
      raise ArgumentError unless date.match?(/\A\d{4}(?:-\d{2})?(?:-\d{2})?\z/)
      Date.iso8601(date.length == 4 ? "#{date}-01-01" : date.length == 7 ? "#{date}-01" : date)
      sort_date = Date.parse(data['date'].to_s)
      errors << "#{name}: date and publication_date disagree" unless sort_date.to_s.start_with?(date)
    rescue ArgumentError, TypeError
      errors << "#{name}: invalid or inconsistent publication date"
    end
    permalink = data['permalink']
    errors << "#{name}: invalid publication permalink" unless permalink.to_s.start_with?('/publication/')
    errors << "#{name}: duplicate permalink" unless permalinks.add?(permalink)
    %w[doi proceedings_doi].each do |field|
      next unless data[field]
      doi = data[field].to_s
      errors << "#{name}: invalid #{field}" unless doi.match?(%r{\A10\.\d{4,9}/\S+\z})
      if field == 'doi'
        key = doi.downcase
        errors << "#{name}: duplicate article DOI with #{identifiers[key]}" if identifiers.key?(key)
        identifiers[key] = name
      end
    end
    if data['doi'] && data['doi'] == data['proceedings_doi']
      errors << "#{name}: proceedings DOI used as an article DOI"
    end
    if data['category'] == 'journal_articles'
      %w[doi volume pages].each { |field| errors << "#{name}: journal article missing #{field}" unless data[field] }
      errors << "#{name}: journal has wrong publication_type" unless data['publication_type'] == 'Journal article'
    end
    if data['category'] == 'presentations' && data['paperurl']
      errors << "#{name}: presentation PDF belongs in slidesurl"
    end
    %w[paperurl slidesurl sourceurl].each do |field|
      next unless data[field]
      url = data[field].to_s
      if url.start_with?('/')
        local = File.join(root, URI::DEFAULT_PARSER.unescape(url))
        errors << "#{name}: missing #{field}: #{url}" unless File.file?(local)
        if %w[paperurl slidesurl].include?(field)
          errors << "#{name}: #{field} is not a PDF" unless File.file?(local) && File.binread(local, 5) == '%PDF-'
        end
      else
        parsed = URI.parse(url)
        errors << "#{name}: #{field} must be an HTTPS URL" unless parsed.is_a?(URI::HTTPS) && parsed.host
        if %w[paperurl slidesurl].include?(field) && !parsed.path.match?(%r{(?:\.pdf|/document)\z}i) && !(parsed.host == 'arxiv.org' && parsed.path.match?(%r{\A/pdf/\d{4}\.\d{4,5}(?:v\d+)?\z}))
          errors << "#{name}: #{field} should point to a PDF, not a landing page"
        end
      end
    end
    if data['pages'] && !data['pages'].to_s.match?(/\A\d+–\d+\z/)
      errors << "#{name}: page range must use an en dash"
    end
    if data['verification_note']
      warnings << "#{name}: #{data['verification_note']}"
    end
    records << data
  rescue Psych::Exception, URI::InvalidURIError => e
    errors << "#{name}: #{e.message.lines.first.strip}"
  end
end
records.each do |data|
  Array(data['related_publications']).each do |url|
    errors << "#{data['permalink']}: missing related publication #{url}" unless permalinks.include?(url)
  end
end
if (index = ARGV.index('--site'))
  require 'nokogiri'
  require 'json'
  site = File.expand_path(ARGV[index + 1] || '_site', root)
  records.each do |data|
    path = File.join(site, data['permalink'])
    path = [path, "#{path}.html", File.join(path, 'index.html')].find { |candidate| File.file?(candidate) }
    unless path
      errors << "#{data['permalink']}: missing generated page"
      next
    end
    document = Nokogiri::HTML(File.read(path))
    citation_authors = document.css('meta[name="citation_author"]').map { |node| node['content'] }
    scholarly = data['category'] != 'presentations' && data['publication_type'] != 'Conference abstract' && data['citation_metadata'] != false
    if scholarly
      errors << "#{data['permalink']}: rendered citation authors differ" unless citation_authors == data['authors']
      %w[title publication_date doi volume issue].each do |field|
        expected = data[field].to_s
        expected = expected.tr('-', '/') if field == 'publication_date'
        actual = document.at_css("meta[name='citation_#{field}']")&.[]('content').to_s
        errors << "#{data['permalink']}: rendered citation_#{field} differs" unless actual == expected
      end
      expected_tags = {}
      if data['category'] == 'journal_articles'
        expected_tags['citation_journal_title'] = data['venue']
      elsif data['publication_type'] == 'SAE technical paper'
        expected_tags['citation_technical_report_institution'] = data['publisher']
        expected_tags['citation_technical_report_number'] = data['identifier']
        expected_tags['citation_conference_title'] = data['conference']
      elsif data['category'] == 'conference_papers'
        expected_tags['citation_conference_title'] = data['venue']
      elsif data['category'] == 'dissertations'
        expected_tags['citation_dissertation_institution'] = data['venue']
      end
      if data['pages']
        first, last = data['pages'].split('–')
        expected_tags['citation_firstpage'] = first
        expected_tags['citation_lastpage'] = last
      end
      if data['paperurl']
        expected_tags['citation_pdf_url'] = data['paperurl'].start_with?('/') ? config['url'] + config['baseurl'].to_s + data['paperurl'] : data['paperurl']
      end
      expected_tags.each do |tag, expected|
        errors << "#{data['permalink']}: rendered #{tag} differs" unless document.at_css("meta[name='#{tag}']")&.[]('content') == expected
      end
      schemas = document.css('script[type="application/ld+json"]').map { |node| JSON.parse(node.content) }
      schema = schemas.find { |item| %w[ScholarlyArticle Thesis].include?(item['@type']) }
      errors << "#{data['permalink']}: missing scholarly JSON-LD" unless schema
      if schema
        errors << "#{data['permalink']}: JSON-LD author order differs" unless schema.fetch('author').map { |author| author['name'] } == data['authors']
        errors << "#{data['permalink']}: JSON-LD publication date differs" unless schema['datePublished'] == data['publication_date']
      end
    elsif document.at_css('meta[name="citation_title"]')
      errors << "#{data['permalink']}: citation tags emitted for a presentation, abstract, or withheld record"
    end
    # A proceedings DOI must never appear in an individual article DOI tag.
    if data['proceedings_doi'] && document.at_css('meta[name="citation_doi"]')&.[]('content') == data['proceedings_doi']
      errors << "#{data['permalink']}: proceedings DOI emitted as article DOI"
    end
    canonical = document.at_css('link[rel="canonical"]')&.[]('href')
    expected_canonical = config['url'] + config['baseurl'].to_s + data['permalink']
    errors << "#{data['permalink']}: canonical URL changed" unless canonical == expected_canonical
  end
  %w[publications-talks cv].each do |listing|
    path = File.join(site, listing, 'index.html')
    unless File.file?(path)
      errors << "Missing #{listing} listing"
      next
    end
    doc = Nokogiri::HTML(File.read(path))
    actual = doc.css('.publication-entry').map { |node| node.at_css('h3 a, h4 a')&.[]('href') }
    expected = categories.flat_map do |category|
      records.select { |data| data['category'] == category }.sort_by { |data| [data['date'].to_s, data['permalink']] }.reverse.map { |data| config['baseurl'].to_s + data['permalink'] }
    end
    # Same-day records may have different stable tie ordering; require category grouping
    # and descending dates, plus an exact one-to-one set of publication links.
    errors << "#{listing}: missing or duplicate publication entries" unless actual.sort == expected.sort
    actual_records = actual.map { |url| records.find { |data| config['baseurl'].to_s + data['permalink'] == url } }.compact
    keys = actual_records.map { |data| [categories.index(data['category']), -Date.parse(data['date'].to_s).jd] }
    errors << "#{listing}: categories or dates are out of order" unless keys == keys.sort
  end
end
puts warnings.map { |warning| "REVIEW: #{warning}" }
puts errors.map { |error| "ERROR: #{error}" }
puts "#{records.length} publications; #{warnings.length} review notes; #{errors.length} errors."
exit(errors.empty? ? 0 : 1)
