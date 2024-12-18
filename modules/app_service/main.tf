# Create an App Service Plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_service_plan_name}${var.random_string_suffix}"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}
