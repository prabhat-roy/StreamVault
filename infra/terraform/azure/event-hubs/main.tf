resource "azurerm_eventhub_namespace" "this" {
  name                = "streamvault-evh"
  resource_group_name = var.rg
  location            = var.location
  sku                 = "Standard"
  capacity            = 4
  auto_inflate_enabled = true
  maximum_throughput_units = 20
}

resource "azurerm_eventhub" "playback_session" {
  name                = "playback.session.started"
  resource_group_name = var.rg
  namespace_name      = azurerm_eventhub_namespace.this.name
  partition_count     = 32
  message_retention   = 7
}

variable "rg"       { type = string }
variable "location" { type = string }
