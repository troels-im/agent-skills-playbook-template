#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_language_files '\.rb$|(^|/)(Gemfile|Rakefile)$'; then
  note "No Ruby files found."
  exit 0
fi

if has_command rubocop && { has_file .rubocop.yml || grep -q rubocop Gemfile 2>/dev/null; }; then
  rubocop
else
  note "Ruby lint skipped: rubocop config/tool not available."
fi

if has_command yard && { has_file .yardopts || grep -q yard Gemfile 2>/dev/null; }; then
  yard doc --no-output --fail-on-warning
else
  note "Ruby documentation check skipped: yard config/tool not available."
fi
