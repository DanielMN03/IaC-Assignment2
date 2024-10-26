resource "random_string" "random_string" {
    length  = 6
    special = false
    upper = false
}

# Define the Storage Account (includes Blob Storage)
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.sa_name}${random_string.random_string.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"                 # or "Premium" based on your needs
  account_replication_type = "LRS"                      # LRS, GRS, ZRS, etc.
}

resource "azurerm_storage_container" "blob_container" {
    name                  = var.sc_name
    storage_account_name  = azurerm_storage_account.storage_account.name
    container_access_type = "private"
}