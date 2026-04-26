# Azure Dedicated HSM — DRM master keys live here, key material never leaves HSM.
resource "azurerm_dedicated_hardware_security_module" "drm" {
  name                = "streamvault-drm-hsm"
  resource_group_name = var.rg
  location            = var.location
  sku_name            = "SafeNet Luna Network HSM A790"

  network_profile {
    network_interface_private_ip_addresses = ["10.70.6.5"]
    subnet_id                              = var.subnet_id
  }

  stamp_id = "stamp1"
  zones    = ["1"]
}

variable "rg"        { type = string }
variable "location"  { type = string }
variable "subnet_id" { type = string }
output "uri" { value = azurerm_dedicated_hardware_security_module.drm.id }
