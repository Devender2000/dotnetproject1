
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "NFResourceGroup"
  location = "Central India"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "nf-app-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind = "Windows"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "nf-webapp-demo-2026"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_app_service_plan.asp.id

  site_config {
    always_on = false
  }
}
