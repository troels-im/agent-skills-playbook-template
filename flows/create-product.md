---
title: Create Product
summary: Turn a product goal into PRD, tickets, implemented slices, tests, and review.
created: 2026-07-05
last_updated: 2026-07-06
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
9. [ ] Map end-to-end user and system flows with
   `playbooks/planning/user-flow-mapping.md`, including checkout-like journeys
   and automation or background-worker flows when relevant.
10. [ ] Build a thorough story inventory with
   `playbooks/planning/user-story-slicing.md`; every story must cover one
   action, be no larger than 5 points, link to relevant flow steps, and include
   happy-path and unhappy-path details.
11. [ ] Persist all product user transformations, user flows, and sliced user
   stories in the trace.
12. [ ] Review the user stories and user flows with
   `playbooks/repository/red-blue-judge-review.md`; fix missing stories,
   missing flows, missing unhappy paths, broad stories, and unclear screen
   details before PRD creation.
13. [ ] Create the PRD with `playbooks/planning/write-prd.md`; every persisted
   user story must become or map to acceptance criteria and requirement files,
   and actions without stories are out of scope.
14. [ ] If the work has UI, calibrate taste with
   `playbooks/design/taste-calibration.md`.
15. [ ] Define the domain, subdomain, verticals, and code organization strategy
   with `playbooks/engineering/code-organization.md`.
16. [ ] Record ADRs with `playbooks/planning/write-adr.md` when decisions need
   durable explanation.
17. [ ] Start ticket planning by creating epics and milestones with
   `playbooks/planning/plan-epics-milestones.md`. Product work must have
   reviewable milestone gates before ticket execution starts.
18. [ ] Create tickets with `playbooks/planning/split-into-tickets.md`. Do not
   start implementation until each accepted slice has an external or local
   ticket linked to its epic, milestone, and relevant artifacts.

For every milestone:

1. [ ] Load the milestone artifact and its tickets from `trace.yaml`.
2. [ ] For every ticket in the milestone:
   - Plan the ticket with `playbooks/repository/plan-issue.md`.
   - Update the ticket with references to relevant artifacts as they are
     created or changed: PRD, requirements, acceptance criteria, user flows,
     epics, milestones, ADRs, reviews, prototypes, and tasks.
   - Address every task with
     `playbooks/repository/implementation-playbook.md` and
     `playbooks/engineering/test-drive-change.md` where useful.
   - Run focused checks and `just turn-test`.
   - When a requirement is implemented, run
     `playbooks/repository/red-blue-judge-review.md` against the
     implementation, linked user story, and acceptance criteria.
   - Fix valid P1/P2 implementation review findings before marking the
     requirement done.
   - Mark completed tasks with `[v]`.
   - Run `just turn-test`.
   - Commit with trace trailers.
3. [ ] Run milestone QA against the included requirements, user stories, user
   flows, acceptance criteria, tickets, and trace evidence.
4. [ ] Update every ticket in the milestone with final artifact references,
   verification evidence, review links, and status.
5. [ ] Pause for human milestone review. Do not start the next milestone until
   the user approves, defers remaining issues, or changes the remaining scope.

QA:

1. [ ] Review whether every persisted user story was delivered using trace,
   code review evidence, and `playbooks/repository/red-blue-judge-review.md`
   with subagents.
2. [ ] Review whether every persisted user or system flow was delivered.
3. [ ] For each user story, check whether it was implemented as described.
4. [ ] If the work has UI, review taste with
   `playbooks/design/ui-taste-review.md`.
5. [ ] Check that no unstoried action is exposed.
6. [ ] If any story or flow is missing, incorrectly implemented, or contradicted by an
   unstoried exposed action, send the work back to implementation with a
   concrete description of what must be done.
7. [ ] Repeat implementation and QA until all user stories pass or the user
   explicitly defers them.

Finish:

1. [ ] Verify the PRD acceptance criteria, user-story coverage, and milestone
   gates.
2. [ ] Run `just pr-test`.
3. [ ] Fix failing PR tests and rerun until passing or blocked.
4. [ ] Summarize shipped work, open risks, and follow-up tickets.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
