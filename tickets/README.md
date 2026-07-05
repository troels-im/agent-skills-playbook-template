# Tickets

Use this folder as the repository-local ticket tracker when no GitHub, GitLab,
or Linear tracker is specified.

Rules:

- Use `tickets/` only for local tickets.
- If an external tracker is configured, create tickets in that tracker instead
  of duplicating them here.
- Do not start durable implementation work until a ticket exists.
- Create one markdown file per local ticket using
  `TICKET-YYYYMMDDTHHMMSSZ-short-slug.md`.
- Link each local ticket to the relevant `work-trace/{trace-id}/trace.yaml`.
- Keep tickets small enough to plan, implement, review, and verify as one
  coherent unit.

Local tickets are tracker records. Implementation tasks still live inside the
matching work trace under `work-trace/{trace-id}/tasks/`.

