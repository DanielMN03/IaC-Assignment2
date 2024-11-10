# putputs for networking module
output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "app_subnet_id" {
  description = "The ID of the Application Subnet."
  value       = azurerm_subnet.app_subnet.id
}

output "db_subnet_id" {
  description = "The ID of the Database Subnet."
  value       = azurerm_subnet.db_subnet.id
}

output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.nsg.id
}

# modules/networking/outputs.tf
output "nsg_name" {
  description = "The name of the Network Security Group."
  value       = azurerm_network_security_group.nsg.name
}
