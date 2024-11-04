variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  type        = string
}

variable "os_type" {
  description = "The operating system type"
  type        = string
}

variable "sku_name" {
  description = "The SKU name"
  type        = string
}