# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = "dansdjsdjlks"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "ogunjebi"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = azurerm_resource_group.myrg.name
}

# Create a storage account
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "dasjkdkhdjskd"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

# Create a storage contianer
resource "azurerm_storage_container" "mystoragecontainer" {
  name                  = "osanle"
  storage_account_name  = azurerm_storage_account.mystorageaccount.name
  container_access_type = "private"
}
