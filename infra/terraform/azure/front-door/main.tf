resource "azurerm_cdn_frontdoor_profile" "this" {
  name                = "streamvault-fd"
  resource_group_name = var.rg
  sku_name            = "Premium_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "this" {
  name                     = "streamvault-cdn"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.this.id
}

variable "rg"            { type = string }
variable "blob_endpoint" { type = string }
output "endpoint" { value = azurerm_cdn_frontdoor_endpoint.this.host_name }
