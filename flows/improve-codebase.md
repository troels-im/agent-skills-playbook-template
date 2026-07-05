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
2. [ ] Select tracker provider. If no GitHub, GitLab, or Linear tracker is
   specified, use local tickets in `tickets/`.
3. [ ] Run a scoped health pass with `playbooks/quality/health.md`.
4. [ ] Analyze boundaries with `playbooks/engineering/design-codebase.md`.
5. [ ] Choose one improvement goal with the user.
6. [ ] Write a spec or ADR with `playbooks/planning/spec.md` or
   `playbooks/planning/write-adr.md`.
7. [ ] Create tickets with `playbooks/planning/split-into-tickets.md`. A
   one-slice improvement still gets one ticket.

For every ticket:

1. [ ] Plan the ticket with `playbooks/repository/plan-issue.md`.
2. [ ] Implement the smallest design improvement.
3. [ ] Run focused checks and `just turn-test`.
4. [ ] Review when requested or required.
5. [ ] Run `just turn-test`.
6. [ ] Commit with trace trailers.
7. [ ] Run `just pr-test`.
8. [ ] Fix failing PR tests and rerun until passing or blocked.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
