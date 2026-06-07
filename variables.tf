variable "project_name" {
  description = "Short identifier used to name all resources (rg-<name>, vnet-<name>, etc.)."
  type        = string
  default     = "azure-terraform-lab"
}

variable "location" {
  description = "Azure region for all resources. Pick one where your subscription has B/D-series vCPU quota."
  type        = string
  default     = "centralus"
}

variable "vnet_address_space" {
  description = "CIDR block(s) for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "CIDR block(s) for the subnet. Must fit inside vnet_address_space."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_size" {
  description = "Azure VM SKU. Verify availability and quota with `az vm list-skus` and `az vm list-usage` before changing."
  type        = string
  default     = "Standard_D2s_v6"
}

variable "admin_username" {
  description = "Linux VM admin account name."
  type        = string
  default     = "azureuser"
}

variable "image_version" {
  description = "Canonical Ubuntu 24.04 LTS server image version. Find current options with `az vm image list --publisher Canonical --offer ubuntu-24_04-lts --sku server --all`."
  type        = string
  default     = "24.04.202606060"
}
