# Flows Index

Flows are user-facing loops for long-running development work. They orchestrate
playbooks without duplicating playbook detail.

## Read Order

1. Read `AGENTS.md`.
2. Read root `index.md`.
3. Read this file.
4. Load the smallest matching flow.
5. Load only playbooks named by the current flow step.

## User Commands

Use `/lets` as the friendly command surface:

```text
/lets create-product {description}
/lets create-prototype {description}
/lets work-on-bug {description}
/lets improve-codebase {description}
/lets research-decision {question}
/lets write-docs {description}
/lets continue {trace-id}
/lets status {trace-id}
```

## Standard Flows

- `create-product.md`: Turn a product idea into PRD, tickets, implemented
  slices, verification, and review.
- `create-prototype.md`: Interview, specify, build, user-test, and revise a
  disposable prototype.
- `work-on-bug.md`: Reproduce, diagnose, fix, verify, and record a bug fix.
- `improve-codebase.md`: Select and execute design or health improvements.
- `research-decision.md`: Research a question and turn the conclusion into an
  ADR, spec, or tickets.
- `write-docs.md`: Generate durable documentation from verified repository
  context.

## Run Checklist

At flow start, create a run checklist from `_template.md`.

Use UTC timestamped slugs for generated run names:

```text
run-YYYYMMDDTHHMMSSZ-short-slug.md
```

Example:

```text
run-20260705T143012Z-create-product.md
```

Use:

```text
work-trace/{trace-id}/runs/{run-id}.md
```

If no trace exists yet, start in:

```text
/tmp/wonop/flows/{run-id}.md
```

Move the run checklist into the trace once the work becomes durable.

For local trace or ticket ids that could otherwise collide, use the same UTC
timestamp plus slug pattern, for example `local-20260705T143012Z-docs-flow`.

## Progress Prefix

Every flow progress message must use:

```text
XX% / YY% / ZZ%: message
```

- `XX`: total progress across the whole flow.
- `YY`: progress for the current ticket or phase.
- `ZZ`: progress for the current task.

Use best-effort percentages and update them as the flow learns its true size.
