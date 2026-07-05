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
2. [ ] Select tracker provider. If no GitHub, GitLab, or Linear tracker is
   specified, use local tickets in `tickets/`.
3. [ ] Interview the user with `playbooks/planning/interview-requirements.md`.
4. [ ] Ask for prototypes, examples, screenshots, or prior decisions that
   should guide the work.
5. [ ] Run `playbooks/repository/five-counsel-consultation.md` in assumption
   discovery mode to identify questions, user transformations, scope risks,
   and assumptions. Do not create the story inventory yet.
6. [ ] Write assumptions with `playbooks/planning/verify-assumptions.md`.
7. [ ] Pause for the user to review the assumptions. Continue without asking
   only when the user explicitly asked not to be disturbed, not to ask, to fill
   gaps, or to proceed with best judgment; record that instruction in the
   assumptions file.
8. [ ] Run `playbooks/repository/five-counsel-consultation.md` using the
   reviewed assumptions to identify candidate user stories.
9. [ ] Build a thorough story inventory with
   `playbooks/planning/user-story-slicing.md`; every story must cover one
   action, be no larger than 5 points, and include happy-path and unhappy-path
   details.
10. [ ] Persist all product user transformations and sliced user stories in the
   trace.
11. [ ] Review the user stories with
   `playbooks/repository/red-blue-judge-review.md`; fix missing stories,
   missing unhappy paths, broad stories, and unclear screen details before PRD
   creation.
12. [ ] Create the PRD with `playbooks/planning/write-prd.md`; every persisted
   user story must become or map to acceptance criteria, and actions without
   stories are out of scope.
13. [ ] Define the domain, subdomain, verticals, and code organization strategy
   with `playbooks/engineering/code-organization.md`.
14. [ ] Record ADRs with `playbooks/planning/write-adr.md` when decisions need
   durable explanation.
15. [ ] Create tickets with `playbooks/planning/split-into-tickets.md`. Do not
   start implementation until each accepted slice has an external or local
   ticket.

For every ticket:

1. [ ] Plan the ticket with `playbooks/repository/plan-issue.md`.
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
3. [ ] Check that no unstoried action is exposed.
4. [ ] If any story is missing, incorrectly implemented, or contradicted by an
   unstoried exposed action, send the work back to implementation with a
   concrete description of what must be done.
5. [ ] Repeat implementation and QA until all user stories pass or the user
   explicitly defers them.

Finish:

1. [ ] Verify the PRD acceptance criteria and user-story coverage.
2. [ ] Run `just pr-test`.
3. [ ] Fix failing PR tests and rerun until passing or blocked.
4. [ ] Summarize shipped work, open risks, and follow-up tickets.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
