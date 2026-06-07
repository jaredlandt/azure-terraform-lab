terraform {
  required_version = ">= 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "264a102a-80b9-4f9a-a807-c897d47e77d4"
  features {}
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-azure-terraform-lab"
  location = "centralus"
}
