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
4. [ ] Run `playbooks/repository/five-counsel-consultation.md` to identify
   questions, user transformations, and candidate user stories.
5. [ ] Pause for the user to answer counsel questions. If the user explicitly
   asked not to be disturbed or to fill gaps, run a second counsel to fill the
   gaps and record assumptions.
6. [ ] Slice stories with `playbooks/planning/user-story-slicing.md`; every
   story must cover one action and be no larger than 5 points.
7. [ ] Persist all product user transformations and sliced user stories in the
   trace.
8. [ ] Review the user stories with
   `playbooks/repository/red-blue-judge-review.md`; fix missing pieces before
   PRD creation.
9. [ ] Create the PRD with `playbooks/planning/write-prd.md`; every persisted
   user story must become or map to acceptance criteria.
10. [ ] Define the domain, subdomain, verticals, and code organization strategy
   with `playbooks/engineering/code-organization.md`.
11. [ ] Record ADRs with `playbooks/planning/write-adr.md` when decisions need
   durable explanation.
12. [ ] Create issues with `playbooks/planning/split-into-tickets.md`.

For every issue:

1. [ ] Plan the issue with `playbooks/repository/plan-issue.md`.
2. [ ] Address every task with `playbooks/repository/implementation-playbook.md`
   and `playbooks/engineering/test-drive-change.md` where useful.
3. [ ] Run focused checks and `just turn-test`.
4. [ ] When a requirement is implemented, run
   `playbooks/repository/red-blue-judge-review.md` against the implementation,
   linked user story, and acceptance criteria.
5. [ ] Fix valid P1/P2 implementation review findings before marking the
   requirement done.
6. [ ] Mark completed tasks with `[v]`.
7. [ ] Run `just turn-test`.
8. [ ] Commit with trace trailers.

QA:

1. [ ] Review whether every persisted user story was delivered using trace,
   code review evidence, and `playbooks/repository/red-blue-judge-review.md`
   with subagents.
2. [ ] For each user story, check whether it was implemented as described.
3. [ ] If any story is missing or incorrectly implemented, send the work back
   to implementation with a concrete description of what must be done.
4. [ ] Repeat implementation and QA until all user stories pass or the user
   explicitly defers them.

Finish:

1. [ ] Verify the PRD acceptance criteria and user-story coverage.
2. [ ] Run `just pr-test`.
3. [ ] Fix failing PR tests and rerun until passing or blocked.
4. [ ] Summarize shipped work, open risks, and follow-up tickets.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
