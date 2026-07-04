---
title: Evaluation Playbook
domain: repository
summary: Design evidence-rich product or workflow evaluations.
created: 2026-07-04
last_used: null
last_updated: 2026-07-04
---

# Evaluation Playbook

Use this playbook when designing or updating an evaluation for agent behavior,
product behavior, workflow reliability, retrieval, reports, or generated
outputs.

## Goal

Make failures actionable enough to fix the product, prompt, fixture, policy, or
contract that caused them.

## Workflow

1. Define the behavior under evaluation.
2. Identify inputs, expected outputs, and forbidden outputs.
3. Separate deterministic checks from judgment-based checks.
4. Use real fixtures when available, minimized to the facts needed.
5. Record required evidence:
   - source documents or fixture ids
   - tool calls or command outputs when relevant
   - expected citations or report fields
   - pass/fail criteria
6. Make failure output point to the missing fact, broken contract, or wrong
   decision.
7. Wire the eval behind `just test` only when it is deterministic and cheap
   enough for the repository.

## Quality Bar

A good eval:

- tests behavior, not implementation taste
- is small enough to debug
- separates retrieval/fact failure from final-answer failure
- records enough evidence for another agent to reproduce the issue
- avoids live network or provider calls unless explicitly accepted
