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
work-trace/{trace-id}/
  trace.yaml
  prd.md
  spec-index.md
  progress.md
  requirements/
  acceptance/
  tasks/
  adrs/
  prototypes/
  reviews/
  context/
  specs/
```

Rules:

- Keep `trace.yaml` as the roll-up ledger.
- Keep facts separate from assumptions.
- Keep trace files concise enough for review.
- Do not store secrets or raw private data.
- Create or update the trace before implementation work begins.
- Put prototypes under `work-trace/{trace-id}/prototypes/{prototype-slug}/`
  when they inform durable work.
- Use `work-trace/_template/` for new traces.
- Use `work-trace/examples/` to inspect provider-specific examples.
