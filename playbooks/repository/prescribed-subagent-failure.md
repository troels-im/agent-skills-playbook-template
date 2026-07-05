---
title: Prescribed Subagent Failure
domain: repository
summary: Stop a flow when a required subagent workflow cannot run and queue a retrospective.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Prescribed Subagent Failure

Use this playbook when a flow or playbook prescribes subagents and the host
cannot run them as specified.

## Rule

Do not silently degrade a prescribed subagent workflow to a sequential
single-agent version.

If the prescribed flow cannot run as explained:

1. Stop the loop immediately.
2. Tell the user which prescribed subagent step could not run.
3. Ask whether to wait, change tools, approve a degraded fallback, or revise
   the flow.
4. Write a retrospective describing what needs to change.
5. Put the retrospective into the review queue.

## Review Queue

When a trace exists, write the queued retrospective under:

```text
work-trace/{trace-id}/reviews/REVIEW-QUEUE-YYYYMMDDTHHMMSSZ-subagent-failure.md
```

If no trace exists, write it under:

```text
work-queue/review-queue/REVIEW-QUEUE-YYYYMMDDTHHMMSSZ-subagent-failure.md
```

Move queued review items into the trace once the durable trace exists. Do not
write review-queue items outside the repository.

## Retrospective Contents

Include:

- flow or playbook name
- prescribed subagent step that failed
- observed limitation
- impact on quality
- user decision needed
- recommended change to the flow or tools
- whether a degraded fallback was explicitly approved

## Anti-Patterns

Avoid:

- saying "subagents unavailable" and continuing anyway
- hiding degraded quality in a PRD or trace note
- treating a prescribed independent review as equivalent to sequential
  self-review
