# Maintaining publications

`_publications/*.md` is the authoritative bibliography. The Publications page, CV, individual pages, search citation tags, and scholarly JSON-LD read these records through the `publication-*.html` includes. Do not maintain a separate rendered citation string or regenerate this collection from the legacy sample TSV files.

## Required fields

- `title`: the source title, without an added terminal period. Preserve original-language titles.
- `authors`: every author, in source order; a YAML list of names. Prefer full names when verified; keep source initials if the full name is unknown. Alexis Castel is emphasized by the renderer. Do not use `et al.` or include affiliations as authors.
- `category`: `journal_articles`, `conference_papers`, `presentations`, or `dissertations`.
- `publication_type`: distinguish journal articles, conference papers, SAE technical papers, conference abstracts, workshop presentations, and doctoral dissertations.
- `venue`: the journal, conference, workshop, or degree-granting institution.
- `publication_date`: a **quoted string** with only the verified precision: `"2013"`, `"2026-10"`, or `"2013-11-21"`.
- `date`: Jekyll's sorting date in the same year/month. When the day or month is unknown, anchor the sort to its first day; this is not evidence of an exact publication date. Formal citations and citation tags use `publication_date`. Open Graph publication timestamps are emitted only for full verified dates. `last_modified_at` records the actual metadata edit date for the sitemap.
- `permalink`: preserve the existing URL even if a year or venue in it is misleading. Add `redirect_from` aliases if a new alternative URL is useful.
- `collection: publications`, `description`, and `metadata_sources`.

## Optional fields

- `doi`: an individual article/paper DOI, without a resolver prefix. Its presence does not imply peer review.
- `proceedings_doi`: a volume-level DOI, always labeled **Proceedings DOI**. It must never be copied into `doi`.
- `publisher` and `conference` distinguish the SAE technical-paper series from its WCX conference and supply the corresponding citation tags.
- `identifier`, `volume`, `issue`, and `pages` (use an en dash, e.g. `"102–125"`). Omit unavailable details.
- `paperurl`: an actual accessible paper PDF URL, local or external. `slidesurl`: a presentation PDF. `sourceurl`: a publisher or repository landing page. Do not label a landing page as a PDF.
- `topics`: a short YAML list of research topics; the topic index is generated automatically.
- `related_publications`: existing publication permalinks for related papers/presentations. They remain separate records with their actual author lists.
- `publication_note`: useful public bibliographic context.
- `verification_note`: a public explanation of a specific unresolved field. Record evidence in `metadata_sources` and the audit report. Never infer an article DOI from its numbering pattern.
- `citation_metadata: false`: withhold Google Scholar citation tags and scholarly JSON-LD while a record awaits essential source verification. Presentations and conference abstracts are excluded automatically. This does not hide the human-readable record or its ordinary SEO metadata.
- `language` for body text; `title_language` when a title is in another language.

Check the original PDF and publisher/conference or institutional record for each publication independently. A conference presentation and a later proceedings paper may share a title but have different authors. Do not mark conference contributions as peer-reviewed without evidence.

## Validation

```bash
./scripts/jekyll-local.sh validate
```

This runs the locked local bundle, metadata checks, a strict-front-matter Jekyll build, generated citation/order checks, and an HTML/internal-link check. It does not push or deploy anything. The optional GitHub Actions workflow performs the same checks on pull requests or manual dispatch and has read-only repository permissions.

The Ruby metadata checker uses standard libraries. Rendered citation checks use Nokogiri, which is already part of the locked GitHub Pages bundle. The HTML/link checker uses Python 3's standard library. JavaScript changes require regenerating the existing bundle with `npm run build:js`.

To inventory external URLs for a separate access check:

```bash
python3 scripts/validate-site.py --external-list /tmp/external-links.txt
```

A 403, bot challenge, login requirement, or tool access failure does not establish that an external URL is broken. Verify a replacement against an authoritative record before changing it.

`docs/`, `scripts/`, and `markdown_generator/` are excluded from the published site. The legacy notebooks/TSV generators remain for historical reference; they do not emit the current schema and must not be run over the live collection.
