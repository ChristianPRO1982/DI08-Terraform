variable "location" {
  type        = string
  description = "Azure region"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used to build resource names"
}

variable "resource_group_name" {
  type        = string
  description = "Existing Azure Resource Group name"
}

variable "sku_name" {
  type        = string
  description = "App Service Plan SKU"
}
