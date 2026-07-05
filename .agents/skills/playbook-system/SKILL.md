---
name: playbook-system
description: Use when working in a repository based on agent-skills-playbook-template; loads AGENTS.md, progressive indexes, repository playbooks, work traces, and turn-test/pr-test verification without assuming a language stack.
---

# Playbook System

Use this skill as a low-token discovery hook for the repository's progressive
docs-as-code workflow.

## Workflow

1. Read `AGENTS.md`.
2. Read root `index.md`.
3. Read the nearest child `index.md` for the area being changed.
4. For repeated work, read `playbooks/index.md` and the smallest matching
   playbook.
5. For long-running user goals, read `flows/index.md` and the smallest matching
   flow.
6. If no playbook matches, use
   `playbooks/repository/no-matching-playbook.md`.
7. Use `just turn-test` before commits and `just pr-test` before PR handoff.

Do not assume a language, package manager, build system, deployment platform, or
test framework beyond the `just turn-test` and `just pr-test` entrypoints.
