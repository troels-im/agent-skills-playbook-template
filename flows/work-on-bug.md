---
title: Work On Bug
summary: Reproduce, diagnose, fix, verify, review, and record a bug fix.
created: 2026-07-05
last_updated: 2026-07-05
---

# Work On Bug

Use for `/lets work-on-bug {description}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] Capture the bug report and expected behavior.
3. [ ] Reproduce or narrow the failure with
   `playbooks/engineering/debug-bug.md`.
4. [ ] Create or update a trace if the bug fix is non-trivial.
5. [ ] Plan the issue with `playbooks/repository/plan-issue.md` when needed.

For the fix:

1. [ ] Fix the smallest confirmed cause.
2. [ ] Add regression coverage where the consuming repo supports it.
3. [ ] Run focused checks and `just turn-test`.
4. [ ] Mark completed tasks with `[v]`.
5. [ ] Review with `playbooks/repository/review-turn.md` when requested or
   required.
6. [ ] Run `just turn-test`.
7. [ ] Commit with trace trailers.
8. [ ] Run `just pr-test`.
9. [ ] Fix failing PR tests and rerun until passing or blocked.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
