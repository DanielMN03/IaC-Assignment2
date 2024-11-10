

# Define the Storage Account (includes Blob Storage)
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.sa_name}${var.random_string_suffix}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

# Define the Blob Storage Container
resource "azurerm_storage_container" "blob_container" {
  name                  = var.sc_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}