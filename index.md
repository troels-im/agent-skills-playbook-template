# Repository Index

This is the first AI-facing map for the repository.

## Read Order

1. Read `AGENTS.md`.
2. Read this file.
3. Load the nearest child `index.md` for the area you will inspect or change.
4. Load the smallest matching playbook only when a repeatable workflow applies.

## Areas

- `docs/index.md`: human-facing explanatory documentation.
- `flows/index.md`: user-facing loops such as create product, prototype, or
  work on bug.
- `.agents/skills/playbook-system/SKILL.md`: optional low-token Agent Skill
  entrypoint for compatible agents.
- `.agents/skills/lets/SKILL.md`: optional low-token entrypoint for `/lets`
  flow commands.
- `playbooks/index.md`: reusable task workflows and workflow governance.
- `policies/index.md`: checks run by `just test`.
- `work-trace/README.md`: checked-in planning artifacts for issue-backed work.

## Core Contract

- `just test` is the only required verification entrypoint.
- The repository is language-neutral by design.
- New domains should add short local `index.md` files before adding large
  instruction files.
- Durable workflow knowledge belongs in playbooks, not in long root files.
- Long-running work should use a `flows/` loop that orchestrates playbooks.
