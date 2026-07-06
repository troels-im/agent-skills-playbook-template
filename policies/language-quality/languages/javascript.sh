#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_language_files '\.(mjs|cjs|js|jsx)$'; then
  note "No JavaScript files found."
  exit 0
fi

manager="$(package_manager)"

if has_language_files '\.(ts|tsx)$|(^|/)tsconfig\.json$'; then
  note "JavaScript lint delegated to TypeScript checker for mixed JS/TS project."
elif package_script_exists lint; then
  [ -n "$manager" ] || fail_missing_tool "npm, pnpm, or yarn" "package.json lint script"
  run_package_script "$manager" lint
else
  note "JavaScript lint skipped: no package.json lint script."
fi

if [ -n "$manager" ] && ! has_language_files '\.(ts|tsx)$|(^|/)tsconfig\.json$' &&
  run_first_package_script "$manager" docs:check documentation:check lint:docs; then
  note "JavaScript documentation check completed."
else
  note "JavaScript documentation check skipped: no docs check script."
fi
