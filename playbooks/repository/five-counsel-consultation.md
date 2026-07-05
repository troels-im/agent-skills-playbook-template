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

The required mechanism is five independent subagents plus a synthesizing
Chairman. If subagents are unavailable, stop the loop and follow
`prescribed-subagent-failure.md`.

## Inputs

- User prompt or goal.
- Relevant prototype screenshots, feedback, docs, tickets, traces, or prior
  decisions.
- The decision the counsel must support.
- Mode: assumption discovery or story consultation.
- Whether the user allowed the agent to fill gaps without asking.
- User-story sizing rules from `playbooks/planning/user-story-slicing.md`.

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
   - assumptions it believes must be verified before story or PRD work
   - user transformations
   - if in assumption discovery mode, story areas and behavior surfaces that
     must be explored after assumptions are reviewed
   - if in story consultation mode, a thorough inventory of every plausible
     one-action user story from its lens, including happy paths and unhappy
     paths
   - if in story consultation mode, screen, entry, success, failure, and
     not-allowed details for each story
   - if in story consultation mode, Fibonacci estimate for each story, capped
     at 5
   - risks or opportunities from its lens
   - one recommended next action
4. Peer review anonymously:
   - give each role the other roles' claims without names
   - ask it to challenge weak, missing, or overconfident arguments
5. Spawn or run the Chairman synthesis.
6. Chairman returns:
   - questions that must be answered by the user
   - assumptions that must be written to an assumptions file before user-story,
     PRD, spec, acceptance criteria, or ticket work starts
   - user transformations
   - if in assumption discovery mode, story areas and behavior surfaces to
     cover after assumption review
   - if in story consultation mode, a thorough, deduplicated inventory of
     one-action user stories found by the counsel
   - if in story consultation mode, happy-path and unhappy-path coverage by
     screen, route, state, or workflow
   - if in story consultation mode, story split recommendations for any story
     larger than 5 points
   - one concrete verdict
   - one actionable next step

## User Input Gate

If the Chairman has questions that affect product direction, user stories,
scope, or acceptance criteria, write the assumptions with
`playbooks/planning/verify-assumptions.md` and pause for user review before
story or PRD work starts.

Continue without asking only when the user explicitly said not to ask, not to
disturb, to fill gaps, or to use best judgment. In that case, run a second
counsel pass to fill the gaps, record the assumptions, and keep them
reversible.

## Output

- counsel questions
- user transformations
- assumptions to verify
- story areas and behavior surfaces, when in assumption discovery mode
- thorough inventory of every plausible one-action user story, when in story
  consultation mode
- screen, entry, success, failure, and not-allowed details, when in story
  consultation mode
- happy-path and unhappy-path coverage notes, when in story consultation mode
- Fibonacci estimate for each story, when in story consultation mode
- split recommendations for stories larger than 5 points, when in story
  consultation mode
- counsel verdict
- next step

Store durable outputs in the active trace when they affect a PRD, prototype,
ticket, ADR, acceptance criterion, or implementation decision.

## Anti-Patterns

Avoid:

- using counsel to replace user input when the user did not permit assumptions
- starting user-story or PRD work before assumptions are written and reviewed
- merging role outputs before peer review
- letting the Chairman invent unsupported certainty
- producing user stories that are not tied to a user transformation
- accepting stories with multiple actions
- accepting stories larger than 5 points
- stopping at a small sample of stories when the product area has many states,
  screens, or unhappy paths
- omitting what the user cannot do
