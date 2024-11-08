resource "azurerm_mssql_server" "sql_server" {
  name                          = "${var.sql_server_name}${var.random_string_suffix}"
  resource_group_name           = var.rg_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.admin_login
  administrator_login_password  = var.admin_login_password
  public_network_access_enabled = false
  minimum_tls_version           = "1.2"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_server_security_alert_policy" "security_alert_policy" {
  resource_group_name          = var.rg_name
  server_name                  = azurerm_mssql_server.sql_server.name
  state                        = "Enabled"
  email_account_admins         = true
  storage_endpoint             = var.storage_endpoint
  storage_account_access_key   = var.storage_account_access_key
  retention_days               = 30  
}


resource "azurerm_mssql_database" "sql_db" {
  name         = "${var.db_name}${var.random_string_suffix}"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

}