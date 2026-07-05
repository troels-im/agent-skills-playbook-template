---
title: Red Blue Judge Review
domain: repository
summary: Run a general subagent red-team, blue-team, judge review for artifacts, plans, stories, specs, PRDs, code, or QA results.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Red Blue Judge Review

Use this playbook when an artifact needs structured adversarial review. It is
general-purpose: use it for user stories, PRDs, specs, implementation diffs,
QA findings, documentation, prototypes, or decisions.

The default mechanism is three independent subagents:

1. Red team attacks the artifact.
2. Blue team defends or concedes with evidence.
3. Judge decides which findings are valid and what must happen next.

If subagents are unavailable, stop the loop and follow
`prescribed-subagent-failure.md`.

## Inputs

- artifact or diff to review
- review objective
- acceptance criteria, user stories, requirements, or rubric
- relevant trace artifacts
- verification already run
- user-story sizing rules from `playbooks/planning/user-story-slicing.md` when
  reviewing stories, PRDs, or story coverage

## Workflow

1. Build a review packet with the artifact, objective, rubric, and evidence.
2. Spawn red team. Ask it to find missing pieces, contradictions, risks,
   unimplemented expectations, user-story gaps, stories with multiple actions,
   stories larger than 5 points, missing happy paths, missing unhappy paths,
   missing end-to-end user or system flows, ambiguous screen details, and
   actions exposed without user stories.
3. Spawn blue team. Give it the packet and red findings. Ask it to defend each
   finding with evidence or concede clearly.
4. Spawn judge. Give it the packet, red findings, and blue responses. Ask it
   for valid findings only.
5. Parent agent verifies judge findings against the actual artifact.
6. Fix valid blocking findings or send them back to the appropriate flow stage.

## Findings Scale

- P1: blocks the stated goal, violates a must-have story or criterion, or risks
  user harm, data loss, security, or irreversible damage.
- P2: materially incomplete, misleading, untested, or likely to cause rework.
- P3: important improvement that does not block the next stage.
- P4: minor polish or clarity.

## Output

For each valid finding:

- priority
- title
- evidence
- affected user story, requirement, acceptance criterion, or file
- affected user flow, when relevant
- required next action
- whether to continue or send work back to implementation

## Anti-Patterns

Avoid:

- reviewing without a clear objective or rubric
- letting blue team hand-wave instead of citing evidence
- treating judge output as final without parent-agent verification
- burying P1/P2 findings under polish
- accepting broad user stories as reviewable units
- accepting story sets that omit checkout, automation, background-worker, or
  other end-to-end flows
- accepting story sets that do not fully define what is possible and impossible
  in the product area
