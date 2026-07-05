---
title: Learn
domain: knowledge
summary: Capture reusable project lessons without bloating root instructions.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Learn

Use this playbook when a task reveals a durable lesson that future agents should
know.

## Goal

Put reusable knowledge in the smallest appropriate place instead of growing root
instructions indefinitely.

## Workflow

1. State the lesson in one sentence.
2. Decide whether it belongs in:
   - a local `index.md`
   - an existing playbook
   - a new playbook
   - human docs
   - a work trace only
3. Add the lesson with evidence and scope.
4. Avoid adding personal preference or one-off task details.
5. Run `just turn-test` when repository files change.

## Anti-Patterns

Avoid:

- adding every observation to `AGENTS.md`
- recording unverified guesses as durable rules
- duplicating the same lesson across many files
