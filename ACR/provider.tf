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