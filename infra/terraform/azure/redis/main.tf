resource "azurerm_redis_cache" "session" {
  name                = "streamvault-session"
  resource_group_name = var.rg
  location            = var.location
  capacity            = 2
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false
  redis_version       = "7"
}

variable "rg"       { type = string }
variable "location" { type = string }
