# azure-terraform-lab

A minimal Azure-with-Terraform sandbox: provision a resource group, virtual network, subnet, NIC, and Linux VM — then destroy them. End to end, from code, in a few minutes, for fractions of a cent.

Built as a portfolio piece while working through the AZ-104 path. The goal is to demonstrate the full Terraform lifecycle (`init / plan / apply / destroy`), version-pinned providers and images, parameterized config via variables, and the discipline of destroying resources in the same session you created them.

## What it provisions

| Resource | Type | Notes |
|---|---|---|
| Resource group | `azurerm_resource_group` | Logical container; free |
| Virtual network | `azurerm_virtual_network` | `10.0.0.0/16`; free |
| Subnet | `azurerm_subnet` | `10.0.1.0/24` |
| Network interface | `azurerm_network_interface` | Private IP only — no public IP by design |
| Random password | `random_password` | 24-char, generated at apply time, held in state |
| Linux VM | `azurerm_linux_virtual_machine` | `Standard_D2s_v6`, Ubuntu 24.04 LTS, password auth (no public IP → no internet exposure) |

The VM uses `Standard_D2s_v6` (general-purpose, 2 vCPU / 8 GiB) rather than the `B1s` the typical "cheap lab" tutorial recommends. **Why:** the original B-series is being capacity-restricted across regions, and the replacement v2 B-series families (`Basv2`, `Bsv2`, `Bpsv2`) have **0 default quota** on free-trial accounts. The Dsv6 family had quota and availability where B-series did not. For a destroy-same-session lab the cost difference is meaningless (~$0.005 vs $0.0005 for five minutes).

## Architecture

```
azurerm_resource_group.lab (rg-azure-terraform-lab)
├── azurerm_virtual_network.lab (vnet-azure-terraform-lab, 10.0.0.0/16)
│   └── azurerm_subnet.lab (snet-azure-terraform-lab, 10.0.1.0/24)
│       └── azurerm_network_interface.lab (nic-azure-terraform-lab, private IP only)
│           └── azurerm_linux_virtual_machine.lab (vm-azure-terraform-lab, D2s_v6)
└── random_password.vm_admin (24 chars, in state, not in source)
```

## Prerequisites

- Terraform `~> 1.5`
- Azure CLI (`az`) — authenticated via `az login` to a subscription with **at least 2 vCPU quota** in the `Dsv6` family (or change `var.vm_size` to a family you do have quota for; see `az vm list-usage --location <region>`)
- A `centralus` region default (or override `var.location`)

## Run

```bash
git clone https://github.com/jaredlandt/azure-terraform-lab.git
cd azure-terraform-lab

az login                               # authenticate
terraform init                         # download providers, write lockfile

# Provision
terraform plan -out=tfplan
terraform apply tfplan

# Inspect
terraform output                       # resource IDs, VM name, private IP
terraform output -raw vm_admin_password  # reveal the generated password (sensitive)

# Destroy — always, before walking away
terraform plan -destroy -out=tfplan.destroy
terraform apply tfplan.destroy
```

Typical end-to-end: ~75s for apply, ~45s for destroy. Total billable VM lifetime in the lab: well under a minute, well under a penny.

## Configuration

All tunable values live in [`variables.tf`](variables.tf) with defaults:

| Variable | Default | Purpose |
|---|---|---|
| `project_name` | `azure-terraform-lab` | Drives all resource names (`rg-<name>`, `vnet-<name>`, …) |
| `location` | `centralus` | Azure region |
| `vnet_address_space` | `["10.0.0.0/16"]` | VNet CIDR |
| `subnet_address_prefix` | `["10.0.1.0/24"]` | Subnet CIDR |
| `vm_size` | `Standard_D2s_v6` | SKU — **check `az vm list-usage`** before changing |
| `admin_username` | `azureuser` | Linux VM admin |
| `image_version` | `24.04.202606060` | Pinned Ubuntu 24.04 LTS server image |

Override any of them inline (`terraform apply -var location=eastus`), via a `terraform.tfvars` file (gitignored), or via `TF_VAR_<name>` env vars.

## Files

```
.
├── main.tf                  Resources, providers
├── variables.tf             Input variables with defaults
├── outputs.tf               Surfaced values (RG, VNet ID, VM name, private IP, sensitive password)
├── .terraform.lock.hcl      Pinned provider versions + SHA hashes — committed
├── .gitignore               Excludes *.tfstate, .terraform/, *.tfvars, etc.
└── docs/                    ADR, runbook, architecture, requirements (sdlc-core scaffold)
```

## Security notes

- **No credentials in source.** Authentication is via `az login`; the subscription ID is not hardcoded.
- **VM password lives in state**, not in `main.tf`. State (`*.tfstate`) is gitignored — it stores secrets in plaintext, so never commit it.
- **VM has no public IP and no NSG.** No internet exposure. The empty VNet means there's nothing else to laterally move from. Both deliberate for a destroy-same-session lab. **Do not add a public IP without also adding an NSG.**
- **Password auth is enabled.** For a real deployment, swap to `admin_ssh_key` with `disable_password_authentication = true`.

## What this isn't

Not production. No remote state, no modules, no CI/CD, no Key Vault, no NSG, no managed identity. Those belong in a follow-on repo. This one is the *first move* — a learner's vertical slice with the discipline of doing it correctly: pinned versions, parameterized config, clean destroy.

## License

MIT — see [LICENSE](LICENSE).
