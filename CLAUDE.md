# CLAUDE

Before doing any work in this repository, read `AGENTS.md` in the repository
root and follow it as mandatory operating guidance.

After `AGENTS.md`, load context progressively:

1. Read `index.md`.
2. Read the nearest child `index.md` for the area being changed.
3. Read `playbooks/index.md` only when a reusable workflow is needed.
4. Load the smallest matching playbook, or
   `playbooks/repository/no-matching-playbook.md` when none matches.

Use `just test` for repository verification. Do not infer a language, package
manager, build system, or deployment stack from this template.
