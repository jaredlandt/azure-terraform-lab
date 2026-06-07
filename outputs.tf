output "resource_group_name" {
  description = "Name of the resource group containing all lab resources."
  value       = azurerm_resource_group.lab.name
}

output "resource_group_id" {
  description = "Azure Resource Manager ID of the resource group."
  value       = azurerm_resource_group.lab.id
}

output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.lab.id
}

output "vm_name" {
  description = "Name of the Linux VM."
  value       = azurerm_linux_virtual_machine.lab.name
}

output "vm_private_ip" {
  description = "Private IP assigned to the VM's NIC. The VM has no public IP by design."
  value       = azurerm_network_interface.lab.private_ip_address
}

output "vm_admin_username" {
  description = "Admin username for SSH (no public IP, so not directly reachable without a jumpbox)."
  value       = azurerm_linux_virtual_machine.lab.admin_username
}

output "vm_admin_password" {
  description = "Generated admin password. Marked sensitive — view with `terraform output -raw vm_admin_password`."
  value       = random_password.vm_admin.result
  sensitive   = true
}
