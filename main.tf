terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.79.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "portfolio_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "portfolio_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.portfolio_rg.name
  location                 = azurerm_resource_group.portfolio_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # ⭐ YE BLOCK ADD KARO (Static Website Enable karne ke liye)
  static_website {
    index_document = "index.html"   # Tumhari main file ka naam
    error_404_document = "error.html" # Optional: Agar page na mile
  }
}