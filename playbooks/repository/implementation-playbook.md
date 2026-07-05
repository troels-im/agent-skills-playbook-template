---
title: Implementation Playbook
domain: repository
summary: Move from idea to prototype to production work without assuming a stack.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Implementation Playbook

Use this playbook for non-trivial implementation work after scope is clear.

## Goal

Turn an idea or issue into a small, verifiable change while preserving the
consumer repository's own stack choices.

## Principles

- Start from a small accepted scope.
- Implement vertical slices tied to user stories or requirements.
- Organize product code by domain, subdomain, and vertical where practical.
- Prefer existing project conventions over new abstractions.
- Use interfaces, traits, or ports only at stable seams such as persistence,
  external services, cross-domain boundaries, replaceable infrastructure, or
  behavior-protecting test seams.
- Research established tools before building custom infrastructure.
- Make dependencies and framework choices explicit.
- Keep prototype code separate from production code unless the consuming
  repository has a different rule.
- Use `just turn-test` as the shared verification entrypoint.

## Workflow

1. Confirm the issue, spec, or accepted scope.
2. Classify risk with `task-risk-classification.md`.
3. Load the nearest project indexes for touched areas.
4. Identify current patterns before editing.
5. Identify the domain, subdomain, and vertical outcome for the change.
6. Use `playbooks/engineering/code-organization.md` when adding or moving
   production code.
7. Implement the smallest coherent slice.
8. Add or update tests, docs, traces, or examples required by the scope.
9. Run focused verification, then `just turn-test` when required.
10. Update trace artifacts and issue status when scope or acceptance changes.
11. Finish with a concise handoff: what changed, verification, risks, and next
   steps.

## Acceptance Standard

Implementation is ready to hand off when:

- accepted scope is covered or explicit deferrals are recorded
- verification evidence exists
- no unrelated refactors are mixed in
- behavior and docs are aligned
- follow-up work is tracked instead of hidden

## Anti-Patterns

Avoid:

- starting from implementation before requirements are traceable
- introducing stack assumptions into this template
- skipping existing project conventions
- adding fake flexibility through unused interfaces or traits
- treating a prototype as production without a deliberate promotion step
