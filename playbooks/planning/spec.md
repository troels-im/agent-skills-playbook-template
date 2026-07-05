---
title: Spec Authoring Playbook
domain: planning
summary: Turn vague intent into an executable, testable spec.
created: 2026-07-04
last_used: null
last_updated: 2026-07-05
---

# Spec Authoring Playbook

Use this playbook when asked to write a spec, file an issue, turn intent into a
backlog item, or make ambiguous work implementation-ready.

## Goal

Refuse to let vague work into implementation. Produce a spec precise enough
that an unfamiliar teammate or agent can execute it without guessing.

## Workflow

1. Understand why:
   - who is affected
   - what problem exists now
   - why it matters
   - what outcome would be visibly better
2. Verify assumptions with `playbooks/planning/verify-assumptions.md` before
   drafting a spec that defines product behavior, scope, acceptance criteria,
   or ticket boundaries. Pause for user review unless the user explicitly said
   not to ask, not to disturb, to fill gaps, or to proceed with best judgment.
3. Scope boundaries:
   - in scope
   - out of scope
   - touched systems or files
   - non-goals
4. Read repository evidence before technical questions.
5. Draft the spec with:
   - verified current state
   - requirements
   - acceptance criteria
   - test strategy
   - dependencies
   - risks
   - rollback or recovery where relevant
6. Ask for user confirmation when the scope is materially ambiguous.
7. Store trace artifacts under `work-trace/{issue-id}/` when issue-backed.
8. Run the checks required by the task risk class.

## Spec Quality Standards

A good spec includes:

- stakeholder context
- verified current state with file references when relevant
- explicit out-of-scope boundaries
- numbered, testable acceptance criteria
- requirement-to-test mapping
- dependencies and sequencing
- risks and assumptions
- exact commands or verification steps when known

## Anti-Patterns

Avoid:

- writing a full issue after the first vague request
- asking questions that repository inspection can answer
- using subjective acceptance criteria such as "works well"
- omitting current-state evidence
- hiding open questions
