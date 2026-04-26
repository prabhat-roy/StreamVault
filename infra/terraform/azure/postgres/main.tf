resource "azurerm_postgresql_flexible_server" "subscription" {
  name                = "streamvault-subscription"
  resource_group_name = var.rg
  location            = var.location
  version             = "16"
  administrator_login = "svadmin"
  administrator_password = "REPLACE_VIA_KV"
  sku_name            = "GP_Standard_D4ds_v5"
  storage_mb          = 524288
  zone                = "1"
  high_availability { mode = "ZoneRedundant" }
  backup_retention_days = 14
  delegated_subnet_id   = var.subnet_id
}

variable "rg"        { type = string }
variable "location"  { type = string }
variable "subnet_id" { type = string }
