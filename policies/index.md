# Policies Index

`just turn-test` runs the deterministic per-turn policy suite.
`just pr-test` runs turn checks plus PR traceability gates.

## Policies

- `file-size/`: source and docs files must stay at or below 1500 lines.
- `change-checkpoint/`: uncommitted local changes over 500 changed lines should
  be committed as a coherent checkpoint.
- `todo-format/`: TODO and FIXME markers must include a ticket id.
- `skill-spec/`: Agent Skill entrypoints must have required front matter.
- `playbook-spec/`: playbooks and flows must use required front matter.
- `index-coverage/`: meaningful folders should have nearby index files.
- `generated-artifacts/`: generated outputs and dependency folders should not
  be committed.
- `secret-hygiene/`: obvious credentials and private keys should not be
  committed.
- `trace-schema/`: work traces must include the required manifest sections.
- `tracker-provider/`: trace manifests must use supported tracker providers.
- `trace-links/`: trace manifest file references must resolve.
- `commit-trailers/`: commits that complete tasks must include trace trailers.
- `requirement-trace/`: requirements must map to code through trace commits.
- `subagent-trace-review/`: PR traceability must receive semantic subagent
  review when traced requirements or referenced code change.

## Entry Points

- `just turn-test`
- `just pr-test`
- `just test`
- `just policies`
- `./policies/check.sh turn`
- `./policies/check.sh pr`
