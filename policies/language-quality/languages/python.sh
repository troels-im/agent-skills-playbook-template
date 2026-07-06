#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.py$')"
[ -n "$files" ] || { note "No Python files found."; exit 0; }

if has_command ruff; then
  printf '%s\n' "$files" | xargs ruff check
elif has_command flake8; then
  printf '%s\n' "$files" | xargs flake8
else
  note "Python lint skipped: neither ruff nor flake8 is available."
fi

if has_command pydocstyle && {
  has_file .pydocstyle || grep -Eq 'pydocstyle|tool\.pydocstyle' pyproject.toml setup.cfg tox.ini 2>/dev/null
}; then
  printf '%s\n' "$files" | xargs pydocstyle
else
  note "Python documentation check skipped: no pydocstyle config/tool."
fi
