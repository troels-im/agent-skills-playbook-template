---
title: Review Turn
domain: repository
summary: Run a subagent red-team, blue-team, judge review against explicit acceptance criteria.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Review Turn

Use this playbook only when the user explicitly asks for a review and clear
acceptance criteria are present.

The default review mechanism is three independent subagents:

1. Red team attacks the completed work.
2. Blue team defends or concedes each attack with evidence.
3. Judge decides which findings are valid and how severe they are.

If the host environment cannot run subagents, record that limitation and use
the single-agent fallback. Do not silently collapse the workflow.

## Gate

Clear acceptance criteria must exist in the user request, issue, accepted spec,
or work trace. Do not invent criteria to make review run.

If criteria are missing or vague, ask the user to provide or approve them, or
record that review was skipped.

## Review Target

Before spawning subagents, define the exact target:

- current worktree diff
- commit or commit range
- pull request
- issue-backed work trace
- specific files or docs

Include accepted scope, acceptance criteria, verification already run, and
relevant `work-trace/{issue-id}/` artifacts.

## Findings Scale

- P1: Critical defect, security issue, data loss, or direct violation of a
  must-have acceptance criterion.
- P2: Unmet acceptance criterion, likely regression, policy violation, or
  materially incomplete fix.
- P3: Important improvement that does not block delivery.
- P4: Minor polish, clarity, or maintainability issue.

## Subagent Workflow

1. Collect the review packet:
   - accepted scope
   - acceptance criteria and source
   - review target
   - files changed
   - verification already run
   - relevant work-trace artifacts
2. Spawn the red team subagent. Ask it to attack the work against acceptance
   criteria, regressions, policy violations, and delivery blockers.
3. Spawn the blue team subagent. Give it the review packet and red team attacks.
   Ask it to defend with concrete evidence or concede each attack.
4. Spawn the judge subagent. Give it the review packet, red team attacks, and
   blue team responses. Ask it to return only valid findings with severity.
5. Parent agent reviews the judge output against the actual files and evidence.
6. Fix every valid P1 and P2 before final delivery when the review is part of
   implementation work.
7. Re-run the review only when fixes materially change the reviewed surface.
   Cap re-review at two passes unless the user explicitly requests more.

## Red Team Prompt Shape

Ask the red team to return:

- attacks tied to an acceptance criterion, direct regression, policy violation,
  or delivery blocker
- file and line evidence where applicable
- why the issue would matter to the user or maintainer
- no style-only comments unless they block an explicit criterion

## Blue Team Prompt Shape

Ask the blue team to return:

- one response per red team attack
- concrete evidence from code, docs, tests, commands, or traces
- clear concession when the attack lands
- no generic reassurance

## Judge Prompt Shape

Ask the judge to return:

- valid findings only
- priority for each finding
- evidence and acceptance-criterion link
- required fix or explicit reason no fix is required
- whether re-review is needed after fixes

## Single-Agent Fallback

Use this only when subagents are unavailable.

1. Record: "Subagents unavailable; using single-agent fallback."
2. Do the red-team pass first and write attacks down.
3. Do the blue-team pass second and answer every attack with evidence or
   concession.
4. Do the judge pass last and emit only valid findings.

Keep the passes separated in working notes so the fallback still preserves the
review discipline.

## Output

For each finding include:

- priority
- concise title
- file and line when applicable
- linked acceptance criterion or direct regression
- evidence
- concrete fix or next step

Also include:

- review target
- acceptance criteria source
- whether subagents were used
- re-review count, if any

## Anti-Patterns

Avoid:

- reviewing without acceptance criteria
- silently skipping subagents when they are available
- letting one subagent see another subagent's conclusions before its own role
  requires them
- listing style opinions before correctness risks
- using generic reassurance instead of evidence
- hiding unresolved P1 or P2 findings
- re-reviewing indefinitely instead of capping the loop
