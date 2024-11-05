#Resource group variables
variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

#Storage account variables
variable "sa_name" {
  description = "The name of the storage account"
  type        = string
}

variable "sc_name" {
  description = "The name of the storage container"
  type        = string
}

#Networking variables


variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string

}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

# Load Balancer variables

variable "lb_public_ip_name" {
  description = "The name of the public IP address for the Load Balancer"
  type        = string
}

variable "lb_name" {
  description = "The name of the Load Balancer"
  type        = string
}

# Database variables

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





# service plan variables

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

