---
title: Create Prototype
summary: Interview, specify, build, test with the user, revise, and capture a prototype.
created: 2026-07-05
last_updated: 2026-07-05
---

# Create Prototype

Use for `/lets create-prototype {description}`.

## Prototype Standard

Aim for the smallest viable prototype type that can answer the question. A
prototype usually means something working, built as fast as possible, with
production best practices intentionally deferred.

Choose the cheapest form that will teach the user something:

- clickable UI for product feel
- working UI with local state for interaction questions
- small terminal or script prototype for logic questions
- thin integration spike for API or workflow questions

For UI/product prototypes, default to Vite, TypeScript, React, and shadcn/ui.
Use any available UI, React, Vite, shadcn, browser, screenshot, or frontend
skills to move quickly and verify that the prototype actually runs.

Do not treat prototype success as production readiness. Record shortcuts and
known gaps before converting prototype learnings into product work.

## Loop

Pre-execute:

1. [ ] Loop setup - create a run checklist from `flows/_template.md`.
2. [ ] Select tracker provider. If no GitHub, GitLab, or Linear tracker is
   specified, use local tickets in `tickets/`.
3. [ ] Interview the user with `playbooks/planning/interview-requirements.md`.
4. [ ] Run `playbooks/repository/five-counsel-consultation.md` in assumption
   discovery mode to identify questions, user transformations, scope risks,
   and assumptions. Do not create the story inventory yet.
5. [ ] Write assumptions with `playbooks/planning/verify-assumptions.md`.
6. [ ] Pause for the user to review the assumptions. Continue without asking
   only when the user explicitly asked not to be disturbed, not to ask, to fill
   gaps, or to proceed with best judgment; record that instruction in the
   assumptions file.
7. [ ] Run `playbooks/repository/five-counsel-consultation.md` using the
   reviewed assumptions to identify candidate user stories.
8. [ ] Map the relevant prototype user and system flows with
   `playbooks/planning/user-flow-mapping.md`.
9. [ ] Build a thorough story inventory with
   `playbooks/planning/user-story-slicing.md`; every story must cover one
   action, be no larger than 5 points, link to relevant flow steps, and include
   happy-path and unhappy-path details.
10. [ ] Persist only the most important prototype user flows, five most
   important sliced user stories, and their user transformations in the trace.
11. [ ] Review those flows and stories with
   `playbooks/repository/red-blue-judge-review.md`; fix missing flows, missing
   unhappy paths, broad stories, and unclear screen details before PRD or spec
   creation.
12. [ ] Create a prototype PRD or spec with `playbooks/planning/write-prd.md`
   or `playbooks/planning/spec.md`; every persisted user story must become or
   map to acceptance criteria.
13. [ ] If the prototype has UI, calibrate taste with
   `playbooks/design/taste-calibration.md`.
14. [ ] Create at least one prototype ticket with
   `playbooks/planning/split-into-tickets.md`. Do not build the prototype until
   the ticket exists.
15. [ ] State the question the prototype must answer.
16. [ ] Pick the smallest viable prototype type.
17. [ ] For UI/product prototypes, use Vite, TypeScript, React, and shadcn/ui
   unless the user chooses a different stack.
18. [ ] Build the prototype with `playbooks/engineering/prototype.md`.
19. [ ] When a requirement is implemented, run
   `playbooks/repository/red-blue-judge-review.md` against the implementation,
   linked user story, and acceptance criteria.
20. [ ] If the prototype has UI, review taste with
   `playbooks/design/ui-taste-review.md`.
21. [ ] Ask the user to test the prototype.
22. [ ] Revise from feedback until the prototype answers the question or the
   user stops the loop.
23. [ ] QA whether the persisted user flows and five persisted user stories were
   delivered as described using trace, code review evidence, and
   `playbooks/repository/red-blue-judge-review.md` with subagents.
24. [ ] Check that no unstoried action is exposed in the prototype.
25. [ ] If any story or flow is missing, wrong, or contradicted by an unstoried exposed
   action, send the work back to implementation with a concrete description of
   what must be done.
26. [ ] Record learnings, shortcuts, and production gaps in the trace.
27. [ ] Run `just pr-test` when repository files changed.
28. [ ] Fix failing PR tests and rerun until passing or blocked.
29. [ ] Decide whether to discard, iterate later, or convert to product work.

If converting to product work:

1. [ ] Create or update the PRD.
2. [ ] Create tickets with `playbooks/planning/split-into-tickets.md`.
3. [ ] Continue with `flows/create-product.md`.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
