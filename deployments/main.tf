terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "navn-rg-backend"                 # Resource group name
    storage_account_name = "sanameds686puu"                  # Storage account name
    container_name       = "navnstoragecontainer"            # The container name where Terraform state will be stored
    key                  = "staging.oblig.terraform.tfstate" # The state file name
  }
}


provider "azurerm" {
  subscription_id = "30ee9279-e76e-409d-8973-00c9792f6bcb"
  features {}

  # Configuration options
}

# Create a resource group
resource "azurerm_resource_group" "rg_dmnassignment2" {
  name     = var.rg_name
  location = var.location

}

# Create a random string
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false

}

# Modules
module "storage" {
  source = "../modules/storage"

  sa_name              = var.sa_name
  rg_name              = azurerm_resource_group.rg_dmnassignment2.name
  location             = var.location
  sc_name              = var.sc_name
  random_string_suffix = random_string.suffix.result
}


module "networking" {
  source = "../modules/networking"

  vnet_name            = var.vnet_name
  rg_name              = azurerm_resource_group.rg_dmnassignment2.name
  location             = var.location
  nsg_name             = var.nsg_name
  lb_name              = var.lb_name
  lb_public_ip_name    = var.lb_public_ip_name
  random_string_suffix = random_string.suffix.result
}

module "database" {
  source = "../modules/database"

  rg_name                    = azurerm_resource_group.rg_dmnassignment2.name
  location                   = var.location
  sql_server_name            = var.sql_server_name
  admin_login                = var.admin_login
  admin_login_password       = var.admin_login_password
  db_name                    = var.db_name
  sku_name                   = var.sku_name
  storage_endpoint           = module.storage.storage_endpoint
  storage_account_access_key = module.storage.storage_account_access_key
  random_string_suffix       = random_string.suffix.result
}

module "app_serivce" {
  source = "../modules/app_service"

  rg_name               = azurerm_resource_group.rg_dmnassignment2.name
  location              = var.location
  app_service_plan_name = var.app_service_plan_name
  os_type               = var.os_type
  sku_name              = var.sku_name
  random_string_suffix  = random_string.suffix.result
}


