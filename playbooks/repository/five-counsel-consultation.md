---
title: Five Counsel Consultation
domain: repository
summary: Use five subagent lenses to generate questions, user transformations, user stories, and one concrete next step.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Five Counsel Consultation

Use this playbook when a product, prototype, strategy, or design prompt needs
divergent thinking before committing to a PRD, spec, issue split, or decision.

The default mechanism is five independent subagents plus a synthesizing
Chairman. If subagents are unavailable, record that limitation and run the same
passes sequentially.

## Inputs

- User prompt or goal.
- Relevant prototype screenshots, feedback, docs, tickets, traces, or prior
  decisions.
- The decision the counsel must support.
- Whether the user allowed the agent to fill gaps without asking.

## Counsel Roles

- Optimist: identify upsides, growth opportunities, and best-case scenarios.
- Contrarian: hunt for fatal flaws, risks, and worst-case scenarios.
- First-Principles Thinker: ignore assumptions and deconstruct from scratch.
- Outsider: analyze with minimal context and surface simple blind spots.
- Executor: focus only on Monday-morning implementation and next actions.

## Workflow

1. Build a counsel packet with the prompt, known facts, constraints, and the
   decision needed.
2. Spawn the five role subagents independently. Do not let one role see another
   role's output before peer review.
3. Ask each role to return:
   - questions for the user
   - user transformations
   - every plausible user story from its lens
   - risks or opportunities from its lens
   - one recommended next action
4. Peer review anonymously:
   - give each role the other roles' claims without names
   - ask it to challenge weak, missing, or overconfident arguments
5. Spawn or run the Chairman synthesis.
6. Chairman returns:
   - questions that must be answered by the user
   - assumptions that can be used only if the user allowed gap filling
   - user transformations
   - every plausible user story found by the counsel
   - one concrete verdict
   - one actionable next step

## User Input Gate

If the Chairman has questions that affect product direction, user stories,
scope, or acceptance criteria, pause and ask the user.

Continue without asking only when the user explicitly said not to ask, not to
disturb, to fill gaps, or to use best judgment. In that case, run a second
counsel pass to fill the gaps, record the assumptions, and keep them
reversible.

## Output

- counsel questions
- user transformations
- every plausible user story
- assumptions, if any
- counsel verdict
- next step

Store durable outputs in the active trace when they affect a PRD, prototype,
ticket, ADR, acceptance criterion, or implementation decision.

## Anti-Patterns

Avoid:

- using counsel to replace user input when the user did not permit assumptions
- merging role outputs before peer review
- letting the Chairman invent unsupported certainty
- producing user stories that are not tied to a user transformation
