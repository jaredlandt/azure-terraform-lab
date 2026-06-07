# azure-terraform-lab

> A learning sandbox for provisioning and tearing down Azure resources with Terraform, end-to-end.

## Quick start

```bash
# Install
terraform init

# Run
terraform plan && terraform apply

# Test
terraform validate && terraform plan
```

## What this is

See [`docs/requirements/0001-initial-problem.md`](docs/requirements/0001-initial-problem.md) for the problem statement, who's affected, and success criteria.

## Project structure

```
.
├── docs/
│   ├── requirements/        Problem statements + acceptance criteria
│   ├── architecture.md      Technical design notes
│   ├── adr/                 Architecture decision records
│   ├── runbook.md           Operations, support, rollback
│   ├── release-notes.md     Release history
│   └── postmortems/         Incident retrospectives
├── src/                     Source code
├── tests/                   Test suite
├── CLAUDE.md                Instructions for Claude when working in this repo
└── CONTRIBUTING.md          Branch, commit, and review conventions
```

## Contributing

Branch naming, commit messages, code-review checklist, and Definition of Done all live in [`CONTRIBUTING.md`](CONTRIBUTING.md).

This repo follows the **SDLC Standard Operating Procedure** — SOP-aligned artifacts live in `docs/` and `.github/`.

## License

MIT License — see [LICENSE](LICENSE) for details
