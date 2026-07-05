---
title: UI Taste Review
domain: design
summary: Review UI for taste, clarity, states, accessibility, motion, content quality, and AI-default design failures.
created: 2026-07-05
last_used: null
last_updated: 2026-07-05
---

# UI Taste Review

Use this playbook when reviewing a UI concept, prototype, implementation,
redesign, screenshot, or pull request.

## Review Checklist

- Design read:
  - Does the UI fit the audience, product kind, and intended vibe?
  - Is one design system or aesthetic used consistently?
- Typography:
  - Is hierarchy clear?
  - Are line lengths readable?
  - Do headings avoid awkward wraps and orphan words?
- Color and surfaces:
  - Is there one coherent palette and accent?
  - Are shadows, borders, cards, and radius choices intentional?
  - Does the page avoid generic AI-gradient or template-like defaults?
- Layout:
  - Does the layout avoid unnecessary symmetry and repeated equal-card rows?
  - Does it use stable responsive constraints?
  - Is whitespace intentional at both desktop and mobile sizes?
- States and interaction:
  - Are loading, empty, error, success, hover, active, focus, and disabled states
    covered?
  - Are destructive actions confirmed?
  - Are forms labeled and validated without placeholder-as-label?
- Accessibility:
  - Do buttons, forms, links, and focus indicators meet contrast expectations?
  - Is semantic HTML used where possible?
  - Do meaningful images have useful alt text?
- Motion:
  - Is motion purposeful and respectful of performance?
  - Are transforms and opacity preferred over top, left, width, or height?
- Content:
  - Is the copy specific and plain?
  - Are placeholder names, lorem ipsum, dead links, and generic claims removed?

## Output

Return findings first:

- priority
- title
- evidence
- affected story, flow, requirement, screen, or file
- required fix

Use `playbooks/repository/red-blue-judge-review.md` with this checklist when a
UI decision is important enough to require subagent review.

