---
title: Incident Retrospective
domain: repository
summary: Write evidence-based retrospectives for incidents, escaped defects, and broken workflows.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Incident Retrospective

Use this playbook for incidents, escaped defects, failed workflows, broken
policies, or repeated agent mistakes.

## Goal

Produce an evidence-based retrospective that explains:

- what happened
- why it happened
- how it was detected
- what fixed or mitigated it
- what should change to prevent recurrence

## Workflow

1. Preserve evidence before rewriting history.
2. Build a concise timeline.
3. Separate confirmed facts from hypotheses.
4. Identify contributing factors across process, tooling, docs, tests, and
   review.
5. Record corrective actions with owners or follow-up issue ids.
6. Update playbooks, policies, or indexes when the lesson is reusable.
7. Run `just test` when repository files change.

## Quality Bar

A good retrospective:

- is blameless but specific
- cites inspectable evidence
- preserves uncertainty where evidence is incomplete
- produces concrete prevention work
- avoids turning a one-off mishap into broad process churn
