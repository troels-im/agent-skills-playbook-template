#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_language_files '\.(ts|tsx)$|(^|/)tsconfig\.json$'; then
  note "No TypeScript files found."
  exit 0
fi

manager="$(package_manager)"

if package_script_exists lint; then
  [ -n "$manager" ] || fail_missing_tool "npm, pnpm, or yarn" "package.json lint script"
  run_package_script "$manager" lint
else
  note "TypeScript lint skipped: no package.json lint script."
fi

if [ -n "$manager" ] && run_first_package_script "$manager" typecheck type-check check:types tsc; then
  note "TypeScript type check completed."
elif [ -x node_modules/.bin/tsc ]; then
  node_modules/.bin/tsc --noEmit
elif has_command tsc && has_file tsconfig.json; then
  tsc --noEmit
else
  note "TypeScript type check skipped: no typecheck script or tsc tool."
fi

if [ -n "$manager" ] && run_first_package_script "$manager" docs:check documentation:check lint:docs typedoc; then
  note "TypeScript documentation check completed."
elif [ -x node_modules/.bin/typedoc ] && { has_file typedoc.json || grep -q typedoc package.json 2>/dev/null; }; then
  node_modules/.bin/typedoc
elif has_command typedoc && { has_file typedoc.json || grep -q typedoc package.json 2>/dev/null; }; then
  typedoc
else
  note "TypeScript documentation check skipped: no docs check script."
fi
