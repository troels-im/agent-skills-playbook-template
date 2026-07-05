---
title: User Flow Mapping
domain: planning
summary: Capture end-to-end user and system flows that connect one-action user stories into complete journeys.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# User Flow Mapping

Use this playbook before finalizing user stories or a PRD for work that spans
multiple steps, screens, services, background jobs, or system states.

## Goal

Keep user stories small while still capturing the complete journey. A user
story covers one action. A user flow captures the order, branches, automation,
and state changes that make the experience coherent.

## Workflow

1. Create or update flow files under
   `work-trace/{trace-id}/user-flows/UF-001-short-title.md`.
2. Identify every touched journey:
   - user-facing flows such as checkout, onboarding, password reset, or admin
     operations
   - system flows such as scheduled jobs, automation runs, webhooks, retries,
     queues, background workers, and notifications
3. For each flow, record:
   - stable id, such as `UF-001`
   - primary actor, including `system` when the flow is automated
   - trigger
   - preconditions
   - steps in order
   - linked user stories or requirements for each step
   - alternate paths, failure paths, retries, cancellation, and recovery
   - state transitions and persisted data
   - visible feedback, logs, notifications, or observability
   - completion condition
   - not-allowed behavior
4. Split broad flows into subflows when they cannot be reviewed on one page.
5. Update `trace.yaml` under `artifacts.user_flows`.
6. Link every story in a multi-step journey back to one or more flow steps.

## Examples

- Webshop checkout flow: cart review, shipping, payment, confirmation,
  inventory reservation, payment failure, retry, abandoned checkout.
- Automation flow: trigger received, job queued, worker starts, external API
  called, retry scheduled, result stored, user notified, failure escalated.

## Verification

- Every multi-step product behavior has a `UF-*` file.
- Every flow step maps to a user story, requirement, or explicit deferral.
- Every story that participates in a journey links back to flow steps.
- Happy paths, unhappy paths, asynchronous work, retries, and recovery paths
  are captured.
- `just turn-test` passes when repository files change.

