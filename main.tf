# ============================
# Terraform Configuration
# ============================
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.5.0"
}

# ============================
# Provider
# ============================
provider "azurerm" {
  features {}
}

# ============================
# Resource Group
# ============================
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# ============================
# App Service Plan
# ============================
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1" # Basic Tier
}

# ============================
# Web App
# ============================
resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  https_only = true
}

# ============================
# Output
# ============================
output "webapp_url" {
  value = azurerm_linux_web_app.web_app.default_hostname
  description = "The default URL of the Web App"
}
