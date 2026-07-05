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
```

## Splitting Guidance

Split stories by:

- one actor
- one action
- one state transition
- one page or view action
- one command
- one integration outcome
- one error recovery path

Avoid bundling multiple nouns or workflows into one story. A story like "manage
users, orders, payment state, fulfillment state, and retries" is multiple
stories.

## Review Checklist

- Does the story contain exactly one action?
- Is the user transformation explicit?
- Is the estimate 1, 2, 3, or 5?
- Could it become one or more acceptance criteria?
- Could an agent implement and review it as one vertical slice?
