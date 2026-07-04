---
title: Repository Policy Change
domain: repository
summary: Add or change repository policy checks behind the just test contract.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Repository Policy Change

Use this playbook when adding, removing, or changing checks under `policies/` or
the `just test` contract.

## Goal

Keep repository policy cheap, deterministic, language-neutral by default, and
easy to understand when it fails.

## Workflow

1. Classify the task as Class 2 unless the change is documentation-only.
2. Define the policy in one sentence.
3. Add or update:
   - `policies/{policy}/check.sh`
   - `policies/{policy}/guide.md`
   - `policies/index.md`
   - `policies/check.sh`
4. Keep the check deterministic and local.
5. Print actionable failure messages with the policy guide path.
6. Avoid introducing language-specific tools unless the consuming repository
   explicitly chooses them.
7. Run focused policy checks and `just test`.

## Quality Bar

A good policy:

- has a clear reason to exist
- fails before expensive work when possible
- names exactly what to fix
- has a short guide
- works in a fresh clone with only the documented assumptions

## Anti-Patterns

Avoid:

- hiding network calls inside generic policy checks
- requiring a language runtime in this template
- failing without a useful guide path
- adding slow checks to the cheap preflight without a clear reason
