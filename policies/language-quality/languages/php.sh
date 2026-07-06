#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.php$')"
[ -n "$files" ] || { note "No PHP files found."; exit 0; }

if has_command php; then
  printf '%s\n' "$files" | while IFS= read -r path; do php -l "$path" >/dev/null; done
else
  note "PHP syntax lint skipped: php is not available."
fi

if has_command phpcs && { has_file phpcs.xml || has_file phpcs.xml.dist; }; then
  phpcs
else
  note "PHP style lint skipped: phpcs config/tool not available."
fi

if has_command phpdoc && { has_file phpdoc.xml || has_file phpdoc.dist.xml; }; then
  phpdoc run -q
else
  note "PHP documentation check skipped: phpdoc config/tool not available."
fi
