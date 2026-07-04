#!/usr/bin/env sh

repo_root() {
  git rev-parse --show-toplevel 2>/dev/null || pwd
}

tracked_and_untracked_files() {
  git ls-files -co --exclude-standard
}

is_text_file() {
  path="$1"
  [ -f "$path" ] || return 1
  grep -Iq . "$path" 2>/dev/null
}
