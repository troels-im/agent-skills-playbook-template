---
title: Careful Mode
domain: safety
summary: Use extra care for destructive or broad file operations.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Careful Mode

Use this playbook before destructive commands, broad rewrites, large deletes,
permission changes, history changes, or operations that are hard to reverse.

## Workflow

1. Inspect `git status --short`.
2. Identify exactly which paths are in scope.
3. Prefer reversible edits.
4. Avoid destructive git commands unless explicitly requested.
5. For deletes, confirm the target is generated, temporary, or explicitly in
   scope.
6. Run focused verification and `just turn-test` when repository files change.

## Safe Exceptions

Generated folders such as dependency installs, caches, and build outputs may be
removed when they are clearly outside source control and the command target is
precise.

## Anti-Patterns

Avoid:

- deleting broad globs without checking expansion
- rewriting history without explicit instruction
- cleaning unrelated user changes
- using destructive commands to solve uncertainty
