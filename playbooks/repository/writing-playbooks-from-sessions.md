---
title: Writing Playbooks From Sessions
domain: repository
summary: Extract durable reusable playbooks from completed agent and user sessions.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Writing Playbooks From Sessions

Use this playbook after a useful free-running workflow has completed and the
team wants to preserve the reusable process.

## Goal

Let collaboration unfold naturally first, then extract the repeatable workflow
into a clear playbook future agents can follow without needing the original
conversation.

## Workflow

1. Finish or clearly advance the immediate user task.
2. Identify the reusable pattern:
   - sequence of actions
   - decisions that mattered
   - checks that prevented mistakes
   - mistakes or near-misses to avoid
   - parts reusable beyond this exact task
3. Inspect nearby playbook conventions.
4. Write the playbook with:
   - front matter
   - when to use it
   - goal
   - inputs
   - workflow
   - outputs
   - verification
   - anti-patterns
5. Update the nearest index.
6. Run `just turn-test`.

## Quality Bar

A good session-derived playbook:

- is grounded in what actually happened
- preserves reusable workflow, not incidental chronology
- names decision points and verification steps
- is readable without the original conversation
- makes future agents more capable, not more constrained

## Anti-Patterns

Avoid:

- writing the playbook before the workflow has proven itself
- copying a draft without adapting it
- capturing every event instead of the repeatable process
- omitting verification
