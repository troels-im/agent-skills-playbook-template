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
3. [ ] Create a prototype PRD or spec with `playbooks/planning/write-prd.md`
   or `playbooks/planning/spec.md`.
4. [ ] State the question the prototype must answer.
5. [ ] Pick the smallest viable prototype type.
6. [ ] For UI/product prototypes, use Vite, TypeScript, React, and shadcn/ui
   unless the user chooses a different stack.
7. [ ] Build the prototype with `playbooks/engineering/prototype.md`.
8. [ ] Ask the user to test the prototype.
9. [ ] Revise from feedback until the prototype answers the question or the
   user stops the loop.
10. [ ] Record learnings, shortcuts, and production gaps in the trace.
11. [ ] Run `just pr-test` when repository files changed.
12. [ ] Fix failing PR tests and rerun until passing or blocked.
13. [ ] Decide whether to discard, iterate later, or convert to product work.

If converting to product work:

1. [ ] Create or update the PRD.
2. [ ] Create issues with `playbooks/planning/split-into-tickets.md`.
3. [ ] Continue with `flows/create-product.md`.

## Progress

Use `XX% / YY% / ZZ%: message` for every progress update.
