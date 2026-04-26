resource "azurerm_media_services_account" "this" {
  name                = "streamvaultmedia"
  location            = var.location
  resource_group_name = var.rg

  storage_account {
    id         = "/subscriptions/00000000/resourceGroups/${var.rg}/providers/Microsoft.Storage/storageAccounts/streamvaultorigin"
    is_primary = true
  }
}

variable "rg"       { type = string }
variable "location" { type = string }
