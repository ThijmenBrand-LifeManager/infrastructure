terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.30.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.18.0"
    }
  }

  # backend "azurerm" {
  #   key      = "terraform.tfstate"
  #   use_oidc = true
  # }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

provider "azapi" {
  use_oidc = true
}

provider "azuread" {}

data "azurerm_client_config" "current" {}