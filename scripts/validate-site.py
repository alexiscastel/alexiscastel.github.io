#!/usr/bin/env python3
"""Check generated HTML and internal links with the Python standard library.

Run after a Jekyll build. External HTTP availability is a separate, optional check;
this validator does not equate access restrictions with broken external links.
"""
import argparse
import json
import re
from collections import Counter
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urljoin, urlsplit


class Page(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.ids = []
        self.links = []
        self.images = []
        self.meta = []
        self.canonical = []
        self.headings = []
        self.schemas = []
        self._schema = None
        self.title = ''
        self._title = False

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if attrs.get('id'):
            self.ids.append(attrs['id'])
        if tag in ('a', 'link') and attrs.get('href'):
            self.links.append(attrs['href'])
        if tag in ('img', 'script', 'iframe', 'source') and attrs.get('src'):
            self.links.append(attrs['src'])
        if tag == 'img':
            self.images.append(attrs)
        if tag == 'meta':
            self.meta.append(attrs)
        if tag == 'link' and attrs.get('rel') == 'canonical':
            self.canonical.append(attrs.get('href'))
        if re.fullmatch('h[1-6]', tag):
            self.headings.append(int(tag[1]))
        if tag == 'script' and attrs.get('type') == 'application/ld+json':
            self._schema = ''
        if tag == 'title':
            self._title = True

    def handle_endtag(self, tag):
        if tag == 'script' and self._schema is not None:
            self.schemas.append(self._schema)
            self._schema = None
        if tag == 'title':
            self._title = False

    def handle_data(self, data):
        if self._schema is not None:
            self._schema += data
        if self._title:
            self.title += data


def validate(directory, origin):
    pages, errors, external = {}, [], set()
    for file in sorted(directory.rglob('*.html')):
        page = Page()
        page.feed(file.read_text(encoding='utf-8'))
        pages[file] = page
    for file, page in pages.items():
        relative = file.relative_to(directory).as_posix()
        # Existing standalone example reports have independent document design.
        themed = not relative.startswith('files/')
        duplicate_ids = [key for key, count in Counter(page.ids).items() if count > 1]
        if duplicate_ids:
            errors.append(f'{relative}: duplicate IDs: {duplicate_ids}')
        if not page.title.strip():
            errors.append(f'{relative}: missing page title')
        for raw in page.schemas:
            try:
                json.loads(raw)
            except json.JSONDecodeError as exc:
                errors.append(f'{relative}: invalid JSON-LD: {exc}')
        if themed:
            if len(page.canonical) != 1:
                errors.append(f'{relative}: expected one canonical URL')
            if not any(m.get('name') == 'description' and m.get('content') for m in page.meta):
                # Redirect pages deliberately omit descriptions and headings.
                if not any(m.get('http-equiv', '').lower() == 'refresh' for m in page.meta):
                    errors.append(f'{relative}: missing description')
            redirect = any(m.get('http-equiv', '').lower() == 'refresh' for m in page.meta)
            if not redirect:
                if page.headings.count(1) != 1:
                    errors.append(f'{relative}: expected exactly one h1')
                if any(after > before + 1 for before, after in zip(page.headings, page.headings[1:])):
                    errors.append(f'{relative}: skipped heading level')
            for image in page.images:
                if 'alt' not in image:
                    errors.append(f'{relative}: missing image alt: {image.get("src")}')
        base = origin + '/' + relative
        for link in page.links:
            if link.startswith(('mailto:', 'tel:', 'data:', 'javascript:')):
                continue
            parsed = urlsplit(urljoin(base, link))
            if parsed.scheme not in ('http', 'https'):
                continue
            if parsed.netloc != urlsplit(origin).netloc:
                external.add(parsed._replace(fragment='').geturl())
                continue
            target = directory / unquote(parsed.path).lstrip('/')
            if target.is_dir():
                target = target / 'index.html'
            elif not target.exists() and target.with_suffix('.html').is_file():
                target = target.with_suffix('.html')
            if not target.is_file():
                errors.append(f'{relative}: missing internal target {link}')
            elif parsed.fragment and target in pages:
                if unquote(parsed.fragment) not in pages[target].ids:
                    errors.append(f'{relative}: missing anchor {link}')
    return pages, sorted(set(errors)), sorted(external)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', nargs='?', type=Path, default=Path('_site'))
    parser.add_argument('--origin', default='https://alexiscastel.github.io')
    parser.add_argument('--external-list', type=Path)
    args = parser.parse_args()
    if not args.directory.is_dir() or not list(args.directory.rglob('*.html')):
        parser.error('Build the site before running this validator.')
    pages, errors, external = validate(args.directory, args.origin)
    if args.external_list:
        args.external_list.write_text('\n'.join(external) + '\n')
    print('\n'.join('ERROR: ' + error for error in errors))
    print(f'{len(pages)} HTML pages; {len(external)} external URLs inventoried; {len(errors)} errors.')
    raise SystemExit(bool(errors))
