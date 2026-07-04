---
title: Choose Workflow
domain: repository
summary: Route a user request to the smallest matching playbook or trace workflow.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Choose Workflow

Use this playbook when the user asks what workflow, skill, or playbook should
handle a request.

## Goal

Pick the smallest useful workflow without loading the whole repository.

## Workflow

1. Read `AGENTS.md`, root `index.md`, and `playbooks/index.md`.
2. Classify the task with `task-risk-classification.md`.
3. Decide whether the request is:
   - clarification or planning
   - issue or ticket work
   - implementation
   - debugging
   - review
   - documentation
   - research
   - context save or restore
4. Load the smallest matching playbook.
5. If none matches, use `no-matching-playbook.md`.
6. Report the selected workflow and why.

## Output

- selected playbook
- task risk class
- required trace artifacts, if any
- verification expected before handoff

## Anti-Patterns

Avoid:

- recommending a workflow without checking the indexes
- loading many playbooks just to choose one
- hiding uncertainty when no playbook matches
