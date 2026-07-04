---
title: Health Check
domain: quality
summary: Run a language-neutral repository health pass.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Health Check

Use this playbook when asked to inspect repository health, quality, or readiness
without a narrower domain playbook.

## Workflow

1. Read `AGENTS.md`, `index.md`, and `policies/index.md`.
2. Inspect repository status.
3. Run `just test`.
4. Review failing policies or checks.
5. Summarize:
   - checks run
   - pass/fail status
   - high-signal risks
   - recommended next actions

## Anti-Patterns

Avoid:

- inventing language-specific checks
- hiding failures in a broad summary
- changing files during a report-only health pass
