# Architecture

> Technical design notes (SOP § 4.2). This is a **first** draft — capture your current thinking before code obscures it. Update as the system evolves.

## Technical approach

Local-only Terraform against the `azurerm` provider, authenticated via `az login` (no service principals until CI/CD later). Start with a single `main.tf` (provider block + one `azurerm_resource_group`), then refactor into `main.tf` / `variables.tf` / `outputs.tf`. Toolchain via Homebrew on macOS. Every session is a full `init → plan → apply → destroy` loop. Remote state and reusable modules are explicitly deferred to Phase 5.

## Dependencies

- **Terraform** (via `hashicorp/tap` Homebrew tap)
- **Azure CLI** (`az`)
- **Terraform `azurerm` provider** (downloaded by `terraform init`)
- **Azure free account** + subscription (with $5 budget alert configured)
- **GitHub** (public repo for version control — portfolio-visible)

## Security considerations

<!-- Authentication, authorization, secrets handling, input validation, transport security. What attack surface does this create? -->

[Replace: security concerns you've identified, or "None known yet"]

## Testing approach

<!-- Unit / integration / manual / regression — which mix fits this project? Where are the high-risk paths that need the most coverage? -->

[Replace: how this will be tested]

## Rollback plan

<!-- If a deployment fails or causes regressions, how do you undo it? Often "git revert + redeploy" — sometimes more nuanced. -->

[Replace: how to roll back if needed]

## Open questions

<!-- Things you don't know yet but need to figure out. Naming them is half the battle. -->

-
