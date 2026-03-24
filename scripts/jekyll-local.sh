#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
RUBY_BUNDLE_BIN="${HOME}/.local/share/gem/ruby/3.2.0/bin/bundle"
BUNDLE_VERSION="${BUNDLE_VERSION:-2.4.19}"

if [[ -x "${RUBY_BUNDLE_BIN}" ]]; then
  BUNDLE_BIN="${RUBY_BUNDLE_BIN}"
else
  BUNDLE_BIN="${BUNDLE_BIN:-bundle}"
fi

export PATH="${HOME}/.local/share/gem/ruby/3.2.0/bin:${PATH}"
export GEM_HOME="${ROOT_DIR}/.gem32"
export GEM_PATH="${ROOT_DIR}/.gem32"
export BUNDLE_PATH="${ROOT_DIR}/vendor/bundle"
export BUNDLE_APP_CONFIG="${ROOT_DIR}/.bundle32"
export BUNDLE_DISABLE_SHARED_GEMS=1

BUNDLE_CMD=("${BUNDLE_BIN}" "_${BUNDLE_VERSION}_")
COMMAND="${1:-serve}"

bundle_setup() {
  (
    cd "${ROOT_DIR}"
    "${BUNDLE_CMD[@]}" check >/dev/null 2>&1 || "${BUNDLE_CMD[@]}" install
  )
}

case "${COMMAND}" in
  install)
    cd "${ROOT_DIR}"
    "${BUNDLE_CMD[@]}" install
    ;;
  build)
    bundle_setup
    cd "${ROOT_DIR}"
    "${BUNDLE_CMD[@]}" exec jekyll build
    ;;
  serve)
    bundle_setup
    cd "${ROOT_DIR}"
    "${BUNDLE_CMD[@]}" exec jekyll serve --host 127.0.0.1 --livereload
    ;;
  clean)
    cd "${ROOT_DIR}"
    rm -rf _site
    ;;
  *)
    cat <<'EOF'
Usage: scripts/jekyll-local.sh [install|build|serve|clean]

  install  Install/update the local bundle
  build    Build the site into _site
  serve    Run the local Jekyll server with livereload
  clean    Remove the generated _site directory
EOF
    exit 1
    ;;
esac
