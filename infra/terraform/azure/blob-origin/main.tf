resource "azurerm_storage_account" "origin" {
  name                     = "streamvaultorigin"
  resource_group_name      = var.rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  is_hns_enabled           = false
}

resource "azurerm_storage_container" "vod" {
  name                  = "vod"
  storage_account_name  = azurerm_storage_account.origin.name
  container_access_type = "private"
}

variable "rg"       { type = string }
variable "location" { type = string }
output "account_name" { value = azurerm_storage_account.origin.name }
output "endpoint"     { value = azurerm_storage_account.origin.primary_blob_endpoint }
