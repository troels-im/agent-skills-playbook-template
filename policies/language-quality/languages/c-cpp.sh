#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

files="$(language_files '\.(c|cc|cpp|cxx|h|hpp|hh|hxx)$')"
[ -n "$files" ] || { note "No C/C++ files found."; exit 0; }

if has_command clang-format && has_file .clang-format; then
  printf '%s\n' "$files" | xargs clang-format --dry-run --Werror
else
  note "C/C++ formatting skipped: clang-format config/tool not available."
fi

if has_command clang-tidy && has_file compile_commands.json; then
  printf '%s\n' "$files" | xargs clang-tidy
else
  note "C/C++ static analysis skipped: clang-tidy compile database/tool not available."
fi

if has_command doxygen && has_file Doxyfile; then
  doxygen Doxyfile
else
  note "C/C++ documentation check skipped: Doxyfile/doxygen not available."
fi
