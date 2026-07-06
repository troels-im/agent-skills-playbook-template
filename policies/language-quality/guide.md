# Language Quality Policy

Language-specific linting and documentation checks live under
`policies/language-quality/languages/`.

Rules:

- Each language has its own checker file.
- A checker must pass when that language is not used in the repository.
- A checker should run standard linting, formatting, static-analysis, or
  documentation validation when the language is present and the repository or
  toolchain makes that possible.
- If a project declares a standard lint or documentation command, the checker
  should use it.
- If no known tool or command is configured, the checker should report the skip
  and pass rather than failing a language-neutral template.
- Add project-specific commands inside the relevant language file instead of
  hard-coding them into the root policy runner.

This policy is intentionally portable: the template assumes `just`, but does
not assume Node, Python, Rust, Go, Java, .NET, PHP, Ruby, or C/C++ tooling is
installed.
