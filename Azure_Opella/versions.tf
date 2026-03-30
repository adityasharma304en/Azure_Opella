terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.66.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.8.1"
    }
  }


}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "182bacdb-f150-4d68-8135-f5f2918be8c7"
}
