# Ticket Trace Policy

Work traces must map requirements to tickets before implementation tasks start.

Each real `work-trace/{trace-id}/trace.yaml` must include a top-level
`tickets:` section. Every requirement must appear under at least one ticket.

For external trackers, ticket entries must include a URL.

For the local tracker, ticket entries must include a file path under
`tickets/`, usually:

```yaml
tickets:
  - id: TICKET-YYYYMMDDTHHMMSSZ-short-slug
    provider: local
    file: ../../tickets/TICKET-YYYYMMDDTHHMMSSZ-short-slug.md
    requirements:
      - REQ-001
```

Use local tickets only when GitHub, GitLab, or Linear is not configured.

