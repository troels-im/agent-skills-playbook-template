#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.(sh|bash|zsh)$')"
[ -n "$files" ] || { note "No shell files found."; exit 0; }

if has_command shellcheck; then
  printf '%s\n' "$files" | xargs shellcheck
else
  note "Shell lint skipped: shellcheck is not available."
fi

if has_command shfmt; then
  diff_output="$(printf '%s\n' "$files" | xargs shfmt -d)"
  [ -z "$diff_output" ] || { printf '%s\n' "$diff_output" >&2; exit 1; }
else
  note "Shell formatting skipped: shfmt is not available."
fi
