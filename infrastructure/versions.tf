# Define Terraform provider
terraform {
  required_version = ">= 1.3"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend"
    storage_account_name = "terraformstate5525"
    container_name       = "tfstate"
    key                  = "modules.terraform.tfstate"
  }
}