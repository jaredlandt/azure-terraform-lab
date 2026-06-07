terraform {
  required_version = ">= 1.5, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-${var.project_name}"
  location = var.location
}

resource "azurerm_virtual_network" "lab" {
  name                = "vnet-${var.project_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
}

resource "azurerm_subnet" "lab" {
  name                 = "snet-${var.project_name}"
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.lab.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_interface" "lab" {
  name                = "nic-${var.project_name}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lab.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "random_password" "vm_admin" {
  length           = 24
  special          = true
  override_special = "!@#$%^&*()-_=+[]"
}

# Password authentication is enabled deliberately for this lab. The VM has
# no public IP and is destroyed in the same session — no internet exposure,
# no persistence. There is no NSG, so anything else in the VNet could reach
# the VM, but the VNet is empty by construction. For any real deployment,
# use admin_ssh_key with disable_password_authentication = true.
resource "azurerm_linux_virtual_machine" "lab" {
  name                            = "vm-${var.project_name}"
  resource_group_name             = azurerm_resource_group.lab.name
  location                        = azurerm_resource_group.lab.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = random_password.vm_admin.result
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.lab.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = var.image_version
  }
}
