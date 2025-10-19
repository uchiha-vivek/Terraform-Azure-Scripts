variable "location" {
  description = "Azure location for the resources"
  default     = "East US 2"
}

variable "resource_group_name" {
  description = "Resource Group name"
  default     = "my-terraform-rg"
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  default     = "my-app-service-plan-terraform"
}

variable "web_app_name" {
  description = "Web App name (must be globally unique)"
  default     = "my-simple-webapp12345-terraform"
}
