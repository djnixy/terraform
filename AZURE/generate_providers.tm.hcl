generate_hcl "_terramate_generated_providers.tf" {
  content {
    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          version = "~> 3.109.0"
        }
      }
      required_version = ">= 1.5.7"
    }

    provider "azurerm" {
      features {}

      # client_id       = "00000000-0000-0000-0000-000000000000"
      # client_secret   = var.client_secret
      # tenant_id       = "10000000-0000-0000-0000-000000000000"
      # subscription_id = "20000000-0000-0000-0000-000000000000"
    }
  }
}


