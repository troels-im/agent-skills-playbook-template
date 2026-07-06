#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_language_files '\.(mjs|cjs|js|jsx|ts|tsx)$|(^|/)package\.json$'; then
  note "No JavaScript or TypeScript files found."
  exit 0
fi

manager="$(package_manager)"

if package_script_exists lint; then
  [ -n "$manager" ] || fail_missing_tool "npm, pnpm, or yarn" "package.json lint script"
  run_package_script "$manager" lint
else
  note "JavaScript/TypeScript lint skipped: no package.json lint script."
fi

if [ -n "$manager" ] && run_first_package_script "$manager" docs:check documentation:check lint:docs typedoc; then
  note "JavaScript/TypeScript documentation check completed."
else
  note "JavaScript/TypeScript documentation check skipped: no docs check script."
fi
