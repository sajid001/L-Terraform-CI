terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
  cloud {
    organization = "mdevTF01"

    workspaces {
      name = "L-Terraform-CI"
    }
  }
}




provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfrg001" {
  name     = "tfrg001"
  location = "uk south"
}

resource "azurerm_storage_account" "tfstorageaccount001" {
  name                     = "tfstorageaccount001"
  resource_group_name      = azurerm_resource_group.tfrg001.name
  location                 = azurerm_resource_group.tfrg001.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
