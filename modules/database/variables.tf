variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "admin_login" {
  description = "The admin login for the SQL server"
  type        = string
  sensitive   = true
}

variable "admin_login_password" {
  description = "The admin login password for the SQL server"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "sku_name" {
  description = "The SKU name"
  type        = string
}