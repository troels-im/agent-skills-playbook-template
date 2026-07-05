---
title: Taste Calibration
domain: design
summary: Establish design direction, audience, aesthetic system, and anti-default guardrails before UI work.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# Taste Calibration

Use this playbook before building or redesigning UI, brand surfaces, marketing
pages, prototypes, or product areas where visual taste affects success.

Adapted from the public taste-skill project by Leonxlnx as durable playbook
guidance rather than an agent-specific skill.

## Workflow

1. Read the brief for:
   - product or page kind
   - audience
   - desired vibe
   - reference links or screenshots
   - existing brand assets
   - accessibility, trust, regulatory, or domain constraints
2. Write a one-line design read:
   `Reading this as: {surface} for {audience}, with {vibe}, leaning toward {system or aesthetic}.`
3. Choose one foundation:
   - existing project design system
   - official design system when the brief names one
   - local component system when the product should own the UI
   - native CSS/Tailwind aesthetic when the direction is visual rather than a
     formal system
4. Set three taste dials:
   - variance: restrained to experimental
   - motion: static to cinematic
   - density: airy to cockpit
5. Record anti-default guardrails:
   - avoid generic AI purple gradients unless the brand asks for them
   - avoid default centered hero plus three equal cards unless it is truly right
   - avoid placeholder copy, fake names, lorem ipsum, and dead links
   - keep one palette, one icon family, and one radius rule
   - use cards only when they communicate hierarchy
6. For UI implementation, require:
   - loading, empty, error, success, hover, active, and focus states
   - readable button and form contrast
   - responsive layout without text overflow
   - motion using transform and opacity, not layout-triggering properties
   - dependency verification before importing libraries

## Output

- design read
- chosen design system or aesthetic
- taste dials
- anti-default guardrails
- state and accessibility expectations

Store durable decisions in the active trace, PRD, ADR, or design note when they
affect implementation.

