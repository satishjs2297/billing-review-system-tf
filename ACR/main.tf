terraform {
  required_version = ">= 0.14.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.43.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "billing-review-sa-rg"
    storage_account_name = "billingreviewsa"
    container_name       = "tfstate"
    key                  = "acr-terraform.tfstate"
  }
  # backend "local" {
  #   path = "./terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "acr_resource_group" {
  name     = "${var.name}-rg"
  location = var.location

  tags = var.tags

}

resource "azurerm_container_registry" "acr" {
  name                = "${var.name}acr"
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = azurerm_resource_group.acr_resource_group.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = var.tags

}