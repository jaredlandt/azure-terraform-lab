# 0001 — Initial problem statement

> The Discovery output for azure-terraform-lab (SOP § 4.1). This is the first requirement summary — the problem this project exists to solve. Captured at scaffold time, refined over iteration.

**Status:** Draft
**Captured:** 2026-06-07

## Problem

I want hands-on fluency with Terraform on Azure, but learning by clicking through the portal doesn't build the infrastructure-as-code muscle. This project is a controlled sandbox to practice the full provision → inspect → destroy loop from code — proving I can stand up real Azure resources and tear them down cleanly, without leaving anything billing in the background.

## Who's affected

Me — working toward AZ-104 and building a portfolio-grade Terraform repo a hiring manager could clone, read, and run.

## Success criteria

- A $5 Azure budget alert is live and test-fired before any billable resource exists
- `terraform -version` and `az account show` both return clean
- A resource group appears in the portal via `apply`, then vanishes after `destroy` — the full round trip
- A B-series VM is stood up and torn down entirely from code, in one session, with the budget still at $0
- `.gitignore` excludes state files; config is split into `variables.tf` / `outputs.tf`; a stranger could clone the repo, read the README, and run it

## Known risks and constraints

- **Orphaned resources** are the real risk, not the tooling — a failed `apply` can half-build something that quietly bills. Mitigation: end every session with `terraform destroy` + a portal resource-group glance; $5 budget alert as backstop.
- **State files leak secrets** — `.tfstate` stores them in plaintext. Committing one is the classic mistake. Mitigation: `.gitignore` excludes `.tfstate`, `.tfstate.*`, `.terraform/`, secret-bearing `.tfvars` *before* the first commit.
- **Scope creep** — turning "get set up" into an open-ended build. Mitigation: Phase 4's "Done when" is the finish line for setup; commit and stop. Phase 5 is a separate, later loop.

## Next steps

When you're ready to act on this:

1. File a feature issue using [`.github/ISSUE_TEMPLATE/feature.md`](../../.github/ISSUE_TEMPLATE/feature.md) — one issue per discrete chunk of work
2. Capture technical approach in [`../architecture.md`](../architecture.md) (SOP § 4.2)
3. Break the work into tickets / commits (SOP § 4.2 task breakdown)
4. Create a working branch — see [`../../CONTRIBUTING.md`](../../CONTRIBUTING.md) for naming
