variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
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

variable "random_string_suffix" {
  description = "The suffix to append to the names of resources"
  type        = string
}