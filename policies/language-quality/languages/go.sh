#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.go$')"
[ -n "$files" ] || { note "No Go files found."; exit 0; }

if has_command gofmt; then
  unformatted="$(printf '%s\n' "$files" | xargs gofmt -l)"
  [ -z "$unformatted" ] || { printf '%s\n' "$unformatted" >&2; exit 1; }
else
  note "Go formatting skipped: gofmt is not available."
fi

if has_file go.mod && has_command go; then
  go vet ./...
else
  note "Go vet skipped: go.mod or go command not available."
fi

if has_command golint; then
  lint_output="$(golint ./...)"
  [ -z "$lint_output" ] || { printf '%s\n' "$lint_output" >&2; exit 1; }
else
  note "Go documentation lint skipped: golint is not available."
fi
