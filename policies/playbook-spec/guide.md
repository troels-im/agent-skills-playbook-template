# Playbook Spec Policy

Every playbook markdown file under `playbooks/`, except `index.md`, must begin
with YAML front matter containing:

- `title`
- `domain`
- `summary`
- `created`
- `last_used`
- `last_updated`

Use `YYYY-MM-DD` dates. `last_used` may be `null`.

Every flow markdown file under `flows/`, except `index.md`, must include
`title`, `summary`, `created`, and `last_updated` front matter.
