---
title: Flow Template
summary: Template for a user-facing development flow run.
created: 2026-07-05
last_updated: 2026-07-06
---

# Flow Template

Copy this structure into a run checklist before executing a flow.

## Run Metadata

- Flow:
- Run id:
- Created UTC:
- Trace:
- Tracker provider:
- User goal:
- Current phase:
- Current milestone:
- Current ticket:
- Current task:
- Verification:

## Progress Rule

Every progress message must use:

```text
XX% / YY% / ZZ%: message
```

## Pre-Execute

1. [ ] Loop setup - use this flow file.
2. [ ] Read `AGENTS.md`, root `index.md`, and `flows/index.md`.
3. [ ] Classify risk with `playbooks/repository/task-risk-classification.md`.
4. [ ] Select tracker provider. If no GitHub, GitLab, or Linear tracker is
   specified, use local tickets in `tickets/`.
5. [ ] Create or reuse a trace if the work is durable.
6. [ ] Record the selected flow, tracker provider, and playbooks.
7. [ ] If a prescribed subagent step cannot run, stop immediately and use
   `playbooks/repository/prescribed-subagent-failure.md`.

## Execute

Add flow-specific steps here.

## Per Ticket

For every ticket:

1. [ ] Plan the ticket with `playbooks/repository/plan-issue.md`.
2. [ ] Address every task in the plan with the relevant implementation
   playbook.
3. [ ] Run focused checks and `just turn-test`.
4. [ ] Mark completed tasks with `[v]`.
5. [ ] Update trace artifacts.
6. [ ] Run `just turn-test` before committing.
7. [ ] Commit with trace trailers when complete.

## Per Milestone

For flows that define milestones:

1. [ ] Execute only tickets assigned to the current milestone.
2. [ ] Update affected tickets with links to artifacts as they are created.
3. [ ] Run milestone QA against included requirements and acceptance criteria.
4. [ ] Pause for human review before starting the next milestone.

## Finish

1. [ ] Run `just pr-test`.
2. [ ] Fix failing PR tests.
3. [ ] Repeat until `just pr-test` passes or a real blocker is recorded.

Only work on details specified in the current goal.
