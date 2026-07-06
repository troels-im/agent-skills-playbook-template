# Language Checkers

Each `*.sh` file in this folder enforces linting or documentation checks for
one language family.

Checker contract:

- Exit 0 when the language is absent.
- Exit 0 with a clear skip message when the language is present but no
  configured or installed tool is available.
- Exit non-zero when a configured or available quality command reports a real
  lint, formatting, static-analysis, or documentation failure.
- Keep checks scoped to source files tracked by Git or newly added but not
  ignored files.
