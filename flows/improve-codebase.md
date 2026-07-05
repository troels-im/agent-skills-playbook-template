---
title: Improve Codebase
summary: Select and execute a design, architecture, or repository health improvement.
created: 2026-07-05
last_updated: 2026-07-05
---

# Improve Codebase

Use for `/lets improve-codebase {description}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] Run a scoped health pass with `playbooks/quality/health.md`.
3. [ ] Analyze boundaries with `playbooks/engineering/design-codebase.md`.
4. [ ] Choose one improvement goal with the user.
5. [ ] Write a spec or ADR with `playbooks/planning/spec.md` or
   `playbooks/planning/write-adr.md`.
6. [ ] Split into issues with `playbooks/planning/split-into-tickets.md` when
   the improvement is too large for one slice.

For every issue:

1. [ ] Plan the issue with `playbooks/repository/plan-issue.md`.
2. [ ] Implement the smallest design improvement.
3. [ ] Run focused checks and `just test`.
4. [ ] Review when requested or required.
5. [ ] Commit with trace trailers.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
