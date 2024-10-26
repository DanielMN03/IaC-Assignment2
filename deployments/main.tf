terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "navn-rg-backend"          # Your resource group name
    storage_account_name  = "sanamercavjosk"           # The new storage account name
    container_name        = "navnstoragecontainer"     # The container name where Terraform state will be stored
    key                   = "oblig.terraform.tfstate" # The state file name
  }
}


provider "azurerm" {
    subscription_id = "30ee9279-e76e-409d-8973-00c9792f6bcb"
    features {}

  # Configuration options
}

resource "azurerm_resource_group" "rg_dmnassignment2" {
    name     = var.rg_name
    location = var.location
  
}
module "storage" {
    source = "../modules/storage"
  
    sa_name  = var.sa_name
    rg_name  = var.rg_name
    location = var.location
    sc_name  = var.sc_name
}

module "networking" {
    source = "../modules/networking"
  
    vnet_name           = var.vnet_name
    rg_name             = var.rg_name
    location            = var.location
    nsg_name            = var.nsg_name
    lb_name             = var.lb_name
    lb_public_ip_name   = var.lb_public_ip_name
}

