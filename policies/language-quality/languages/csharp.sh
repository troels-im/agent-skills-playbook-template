#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

if ! has_language_files '\.cs$|\.csproj$|\.sln$'; then
  note "No C# files found."
  exit 0
fi

if has_language_files '\.csproj$|\.sln$' && has_command dotnet; then
  dotnet format --verify-no-changes --verbosity minimal
else
  note "C# formatting/lint skipped: dotnet project or tool not available."
fi

if has_command docfx && has_file docfx.json; then
  docfx metadata docfx.json
else
  note "C# documentation check skipped: docfx config/tool not available."
fi
