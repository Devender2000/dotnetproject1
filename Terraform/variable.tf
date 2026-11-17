variable "resource_group_name" {
  description = "The name of the resource"
  type = string
  default = "rg-netflix"
}

variable "location" {
    description = "The location of the resource"
    type = string
    default = "East US"
}

variable "ASP_Name" {
  description = "The name of the App Service Plan"
  type = string
  default = "asp-netflix"
}

variable "App_Name" {
  description = "The name of the App service"
  type = string
  default = "webapp-netflix11"
}

