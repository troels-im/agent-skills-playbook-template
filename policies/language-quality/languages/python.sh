#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.py$')"
if [ -z "$files" ] && ! { has_file pyproject.toml || has_file setup.py || has_file setup.cfg || has_file requirements.txt; }; then
  note "No Python files found."
  exit 0
fi

[ -n "$files" ] || { note "Python project metadata found, but no Python source files found."; exit 0; }

if has_command ruff; then
  printf '%s\n' "$files" | xargs ruff check
elif has_command flake8; then
  printf '%s\n' "$files" | xargs flake8
else
  note "Python lint skipped: neither ruff nor flake8 is available."
fi

if has_command ruff; then
  ruff format --check
elif has_command black; then
  printf '%s\n' "$files" | xargs black --check
else
  note "Python formatting skipped: neither ruff format nor black is available."
fi

if has_command isort && {
  has_file .isort.cfg || grep -Eq 'tool\.isort|isort' pyproject.toml setup.cfg tox.ini 2>/dev/null
}; then
  printf '%s\n' "$files" | xargs isort --check-only
else
  note "Python import-order check skipped: no isort config/tool."
fi

if has_command mypy && {
  has_file mypy.ini || grep -Eq 'tool\.mypy|mypy' pyproject.toml setup.cfg tox.ini 2>/dev/null
}; then
  mypy .
elif has_command pyright && { has_file pyrightconfig.json || grep -q pyright pyproject.toml 2>/dev/null; }; then
  pyright
else
  note "Python type check skipped: no mypy/pyright config/tool."
fi

if has_command pydocstyle && {
  has_file .pydocstyle || grep -Eq 'pydocstyle|tool\.pydocstyle' pyproject.toml setup.cfg tox.ini 2>/dev/null
}; then
  printf '%s\n' "$files" | xargs pydocstyle
else
  note "Python documentation check skipped: no pydocstyle config/tool."
fi
