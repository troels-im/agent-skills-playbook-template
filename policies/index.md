# Policies Index

`just test` runs the repository policy suite.

## Policies

- `file-size/`: source and docs files must stay at or below 1500 lines.
- `change-checkpoint/`: uncommitted local changes over 500 changed lines should
  be committed as a coherent checkpoint.
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

## Entry Points

- `just test`
- `just policies`
- `./policies/check.sh`
