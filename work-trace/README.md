# Work Trace

Use `work-trace/{trace-id}/` for checked-in planning artifacts for non-trivial
ticket-backed or local work.

Trace ids are provider-prefixed by default:

- `github-123`
- `gitlab-456`
- `linear-ENG-123`
- `local-short-slug`

Expected layout:

```text
 tickets/
   TICKET-YYYYMMDDTHHMMSSZ-short-slug.md
work-trace/{trace-id}/
  trace.yaml
  prd.md
  spec-index.md
  progress.md
  requirements/
  acceptance/
  assumptions/
  user-flows/
  tasks/
  adrs/
  prototypes/
  runs/
  reviews/
  context/
  specs/
```

Rules:

- Keep `trace.yaml` as the roll-up ledger.
- Pick a tracker provider before durable planning starts: GitHub, GitLab,
  Linear, or local.
- If no external tracker is configured, create local tickets in `tickets/`.
- Do not create implementation tasks until the ticket exists and is linked
  from `trace.yaml`.
- Keep facts separate from assumptions.
- Write assumptions to
  `assumptions/ASM-YYYYMMDDTHHMMSSZ-short-slug.md` and review them before
  creating user stories, specs, PRDs, acceptance criteria, or tickets.
- Put end-to-end journey maps under
  `user-flows/UF-001-short-title.md` and link user stories to the relevant
  flow steps.
- Put every durable requirement in `requirements/REQ-###-short-title.md`.
  PRDs may summarize requirements, but must not be the only place they exist.
- Keep trace files concise enough for review.
- Do not store secrets or raw private data.
- Create or update the trace before implementation work begins.
- Put prototypes under `work-trace/{trace-id}/prototypes/{prototype-slug}/`
  when they inform durable work.
- Put flow run checklists under
  `work-trace/{trace-id}/runs/run-YYYYMMDDTHHMMSSZ-short-slug.md`.
- Use UTC timestamped slugs for local ids that could collide.
- Use `work-trace/_template/` for new traces.
- Use `work-trace/examples/` to inspect provider-specific examples.
- Map every requirement to code through `code_refs` and a commit with a
  `Trace-Req` trailer.
