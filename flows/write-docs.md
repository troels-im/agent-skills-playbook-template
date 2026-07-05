---
title: Write Docs
summary: Generate durable documentation from verified repository context.
created: 2026-07-05
last_updated: 2026-07-05
---

# Write Docs

Use for `/lets write-docs {description}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] Confirm audience, scope, and source of truth.
3. [ ] Gather verified context from indexes, code, traces, and existing docs.
4. [ ] Generate or update docs with
   `playbooks/documentation/document-generate.md`.
5. [ ] Link docs to requirements, ADRs, or traces when they explain durable
   behavior.
6. [ ] Run focused checks and `just turn-test`.
7. [ ] Review with the user and revise once for clarity.
8. [ ] Run `just turn-test`.
9. [ ] Commit with trace trailers when the docs complete a traced task.
10. [ ] Run `just pr-test`.
11. [ ] Fix failing PR tests and rerun until passing or blocked.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
