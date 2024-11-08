output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "blob_container_url" {
  description = "The URL of the blob container."
  value       = format("https://%s.blob.core.windows.net/%s", azurerm_storage_account.storage_account.name, azurerm_storage_container.blob_container.name)
}

output "storage_endpoint" {
  description = "The primary Blob endpoint of the storage account."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_account_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}
