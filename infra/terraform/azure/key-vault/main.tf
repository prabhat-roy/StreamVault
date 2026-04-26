data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = "streamvault-kv"
  location            = var.location
  resource_group_name = var.rg
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
  purge_protection_enabled = true
  enable_rbac_authorization = true
}

variable "rg"       { type = string }
variable "location" { type = string }
output "vault_uri" { value = azurerm_key_vault.this.vault_uri }
