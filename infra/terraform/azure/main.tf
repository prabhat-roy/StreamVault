terraform {
  required_version = ">= 1.6.0"
  required_providers { azurerm = { source = "hashicorp/azurerm", version = "~> 3.110" } }
  backend "azurerm" {
    resource_group_name  = "streamvault-tfstate"
    storage_account_name = "streamvaulttfstate"
    container_name       = "prod"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" { features {} }

resource "azurerm_resource_group" "main" {
  name     = "streamvault-prod"
  location = "westeurope"
}

module "vnet"        { source = "./vnet",        rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "aks"         { source = "./aks",         rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location, subnet_id = module.vnet.aks_subnet_id }
module "postgres"    { source = "./postgres",    rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location, subnet_id = module.vnet.db_subnet_id }
module "redis"       { source = "./redis",       rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "event_hubs"  { source = "./event-hubs",  rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "blob_origin" { source = "./blob-origin", rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "front_door"  { source = "./front-door",  rg = azurerm_resource_group.main.name, blob_endpoint = module.blob_origin.endpoint }
module "media_svc"   { source = "./media-services", rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "key_vault"   { source = "./key-vault",   rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location }
module "dedicated_hsm" { source = "./dedicated-hsm", rg = azurerm_resource_group.main.name, location = azurerm_resource_group.main.location, subnet_id = module.vnet.hsm_subnet_id }
