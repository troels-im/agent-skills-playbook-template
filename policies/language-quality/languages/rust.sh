#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_file Cargo.toml && ! has_language_files '\.rs$'; then
  note "No Rust files found."
  exit 0
fi

has_file Cargo.toml || { note "Rust checks skipped: no Cargo.toml."; exit 0; }
has_command cargo || fail_missing_tool cargo "Rust project detected"

cargo fmt --all -- --check
cargo clippy --all-targets --all-features -- -D warnings
cargo doc --no-deps --quiet
