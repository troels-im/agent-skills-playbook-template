---
title: Create Product
summary: Turn a product goal into PRD, tickets, implemented slices, tests, and review.
created: 2026-07-05
last_updated: 2026-07-05
---

# Create Product

Use for `/lets create-product {description}`.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] Interview the user with `playbooks/planning/interview-requirements.md`.
3. [ ] Ask for prototypes, examples, screenshots, or prior decisions that
   should guide the work.
4. [ ] Create the PRD with `playbooks/planning/write-prd.md`.
5. [ ] Record ADRs with `playbooks/planning/write-adr.md` when decisions need
   durable explanation.
6. [ ] Create issues with `playbooks/planning/split-into-tickets.md`.

For every issue:

1. [ ] Plan the issue with `playbooks/repository/plan-issue.md`.
2. [ ] Address every task with `playbooks/repository/implementation-playbook.md`
   and `playbooks/engineering/test-drive-change.md` where useful.
3. [ ] Run focused checks and `just test`.
4. [ ] Mark completed tasks with `[v]`.
5. [ ] Review with `playbooks/repository/review-turn.md` when requested or
   required by acceptance criteria.
6. [ ] Commit with trace trailers.

Finish:

1. [ ] Verify the PRD acceptance criteria.
2. [ ] Run `just test`.
3. [ ] Summarize shipped work, open risks, and follow-up tickets.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
