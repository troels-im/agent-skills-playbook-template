# Trace Schema Policy

Every real trace under `work-trace/`, excluding `_template`, must have a
`trace.yaml` with the core sections needed for traceability:

- `trace_id`
- `tracker`
- `tickets`
- `artifacts`
- `requirements`
- `acceptance`
- `tasks`
- `commits`
- `code_refs`
- `test_refs`

Use provider-prefixed trace directories such as `github-123`,
`gitlab-456`, `linear-ENG-123`, or `local-short-slug`.

If no external tracker is configured, set `tracker.provider: local` and link
ticket files from `tickets/`.
