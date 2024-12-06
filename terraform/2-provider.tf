provider "azurerm" {
    features {}
    subscription_id = "fb2cae0e-2fab-42f5-96fe-c8a6c4a7559c"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}