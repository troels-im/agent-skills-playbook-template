#!/usr/bin/env sh

tracked_source_files() {
  git ls-files -co --exclude-standard |
  grep -Ev '(^|/)(node_modules|vendor|dist|build|target|coverage|\.cache|\.venv|venv|__pycache__)/' || true
}

language_files() {
  pattern="$1"
  tracked_source_files | grep -E "$pattern" || true
}

has_language_files() {
  pattern="$1"
  language_files "$pattern" | grep -q .
}

has_file() {
  [ -f "$1" ]
}

has_command() {
  command -v "$1" >/dev/null 2>&1
}

note() {
  printf '%s\n' "$1"
}

fail_missing_tool() {
  tool="$1"
  reason="$2"
  printf '%s required but not available: %s\n' "$tool" "$reason" >&2
  exit 1
}

package_script_exists() {
  script="$1"
  [ -f package.json ] && grep -Eq "\"${script}\"[[:space:]]*:" package.json
}

package_manager() {
  if [ -f pnpm-lock.yaml ] && has_command pnpm; then
    printf 'pnpm\n'
  elif [ -f yarn.lock ] && has_command yarn; then
    printf 'yarn\n'
  elif has_command npm; then
    printf 'npm\n'
  else
    printf '\n'
  fi
}

run_package_script() {
  manager="$1"
  script="$2"
  case "$manager" in
    pnpm) pnpm run "$script" ;;
    yarn) yarn "$script" ;;
    npm) npm run "$script" ;;
    *) fail_missing_tool "package manager" "package.json script '$script'" ;;
  esac
}

run_first_package_script() {
  manager="$1"
  shift
  for script in "$@"; do
    if package_script_exists "$script"; then
      run_package_script "$manager" "$script"
      return 0
    fi
  done
  return 1
}
