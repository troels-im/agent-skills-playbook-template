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
2. [ ] Interview the user with `playbooks/planning/interview-requirements.md`.
3. [ ] Run `playbooks/repository/five-counsel-consultation.md` to identify
   questions, user transformations, and candidate user stories.
4. [ ] Pause for the user to answer counsel questions. If the user explicitly
   asked not to be disturbed or to fill gaps, run a second counsel to fill the
   gaps and record assumptions.
5. [ ] Persist only the five most important prototype user stories and their
   user transformations in the trace.
6. [ ] Review those five stories with
   `playbooks/repository/red-blue-judge-review.md`; fix missing pieces before
   PRD or spec creation.
7. [ ] Create a prototype PRD or spec with `playbooks/planning/write-prd.md`
   or `playbooks/planning/spec.md`; every persisted user story must become or
   map to acceptance criteria.
8. [ ] State the question the prototype must answer.
9. [ ] Pick the smallest viable prototype type.
10. [ ] For UI/product prototypes, use Vite, TypeScript, React, and shadcn/ui
   unless the user chooses a different stack.
11. [ ] Build the prototype with `playbooks/engineering/prototype.md`.
12. [ ] When a requirement is implemented, run
   `playbooks/repository/red-blue-judge-review.md` against the implementation,
   linked user story, and acceptance criteria.
13. [ ] Ask the user to test the prototype.
14. [ ] Revise from feedback until the prototype answers the question or the
   user stops the loop.
15. [ ] QA whether the five persisted user stories were delivered as described
   using trace, code review evidence, and
   `playbooks/repository/red-blue-judge-review.md` with subagents.
16. [ ] If any story is missing or wrong, send the work back to implementation
   with a concrete description of what must be done.
17. [ ] Record learnings, shortcuts, and production gaps in the trace.
18. [ ] Run `just pr-test` when repository files changed.
19. [ ] Fix failing PR tests and rerun until passing or blocked.
20. [ ] Decide whether to discard, iterate later, or convert to product work.

If converting to product work:

1. [ ] Create or update the PRD.
2. [ ] Create issues with `playbooks/planning/split-into-tickets.md`.
3. [ ] Continue with `flows/create-product.md`.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
