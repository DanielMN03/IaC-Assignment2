# Purpose: Define the input variables for the storage module
variable "sa_name" {
  description = "The name of the storage account"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "sc_name" {
  description = "The name of the storage container"
  type        = string
}

variable "random_string_suffix" {
  description = "The suffix to append to the names of resources"
  type        = string
}