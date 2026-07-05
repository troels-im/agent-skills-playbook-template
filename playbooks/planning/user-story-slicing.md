---
title: User Story Slicing
domain: planning
summary: Keep user stories to one user action and at most five Fibonacci story points.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# User Story Slicing

Use this playbook when brainstorming, reviewing, writing, or splitting user
stories.

## Rule

Each user story must cover exactly one user action.

If a story is larger than 5 Fibonacci story points, it is too broad and must be
split before PRD, acceptance criteria, or ticket creation.

Before starting the story inventory, verify assumptions with
`playbooks/planning/verify-assumptions.md`. Pause for user review unless the
user explicitly said not to ask, not to disturb, to fill gaps, or to proceed
with best judgment.

Story generation must be thorough. For a full product area, enumerate every
meaningful user action, including happy paths, unhappy paths, empty states,
permission states, validation failures, recovery paths, and protected-route
states. Seven stories is not enough for a full webshop; password-based
authentication can easily be seven stories by itself.

When actions belong to a larger journey, first capture the journey with
`playbooks/planning/user-flow-mapping.md`. User stories stay one-action; user
flows capture ordering, branches, background work, retries, and state
transitions.

## Point Reference

- 1 point: simple copy, label, or configuration change, such as updating copy
  on a landing page.
- 2 points: small behavior change at one clear seam.
- 3 points: small vertical interaction with straightforward tests.
- 5 points: one complete functionality across repository, service,
  controller, view, API, and corresponding frontend.
- 8+ points: too broad for one user story; split it.

## Good Story Shape

Use stable IDs:

```text
US-001: As a {user}, I can {one action}, so that {transformation}.
Estimate: 3

Details:
- Screen '{screen name}': what the user sees, enters, clicks, and expects.
- Flow links: `UF-001` step numbers, or `none`.
- Entry: how the user reaches this state.
- Success: what happens when the action works.
- Failure: what happens when validation, permissions, network, or state fail.
- Not allowed: what the user cannot do from this story.
```

The first sentence states the one action. The details make the page or flow
unambiguous enough that a designer, developer, tester, or agent knows what is
possible and what is not.

## Coverage Standard

For every domain, subdomain, vertical, screen, view, route, command, or state
machine touched by a product or prototype, cover:

- happy path
- validation errors
- wrong input
- missing input
- permission denied
- unauthenticated access
- authenticated access
- empty state
- loading state
- retry or recovery path
- navigation in and out of the flow
- end-to-end journey coverage
- asynchronous or background system steps
- irreversible or destructive action confirmation
- success feedback
- failure feedback

If the user should be able to do something, there must be a user story for it.
If there is no user story for an action, the product should not expose that
action.

For authentication, consider separate stories for actions such as:

- create account
- log in with valid credentials
- see an error for wrong password
- see an error for unknown account
- request password reset
- complete password reset
- access a protected page before login
- access a protected page after login
- log out

## Splitting Guidance

Split stories by:

- one actor
- one action
- one flow step
- one state transition
- one page or view action
- one command
- one integration outcome
- one error recovery path

Avoid bundling multiple nouns or workflows into one story. A story like "manage
users, orders, payment state, fulfillment state, and retries" is multiple
stories.

Split broad administration or management stories into one action per object and
state transition, such as "view users", "disable a user", "view orders",
"change fulfillment state", or "retry a failed payment capture".

## Review Checklist

- Does the story contain exactly one action?
- Does it link to a user flow when it participates in a multi-step journey?
- Does the story include enough screen, entry, success, failure, and not-allowed
  detail to remove ambiguity?
- Are happy and unhappy paths covered for the area?
- Is the user transformation explicit?
- Is the estimate 1, 2, 3, or 5?
- Could it become one or more acceptance criteria?
- Could an agent implement and review it as one vertical slice?
- Is every exposed action backed by a story, and every story backed by an
  exposed action?
