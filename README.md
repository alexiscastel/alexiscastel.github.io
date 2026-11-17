# Personal page

A personal website based on [Academic Pages](https://github.com/academicpages/academicpages.github.io).

## Content

- Home
- Posts
- Project portfolio
- Publications
- CV
- Talks

## Local usage

This repo includes a helper script for local Jekyll workflows:

```bash
./scripts/jekyll-local.sh install
./scripts/jekyll-local.sh build
./scripts/jekyll-local.sh serve
./scripts/jekyll-local.sh clean
```

### Commands

- `install`: install or update the local Ruby bundle
- `build`: generate the static site into `_site/`
- `serve`: run the local Jekyll server on `http://127.0.0.1:4000`
- `clean`: remove the generated `_site/` directory

## Requirements

- Ruby 3.2
- `ruby-dev`
- `build-essential`
- Bundler `2.4.19`

The script uses repo-local bundle directories and avoids relying on global gem state.

## Research and publication maintenance

Publication metadata lives in `_publications/` and generates the bibliography on all public pages. See [the publication maintenance guide](docs/PUBLICATIONS.md) for the schema, evidence conventions, and handling of papers versus presentations.

Run the full local check before review:

```bash
./scripts/jekyll-local.sh validate
```

The pull-request validation workflow builds and checks the site without deploying it. Keep publishing as a separate, deliberate action.
