resource "azurerm_virtual_network" "this" {
  name                = "streamvault"
  address_space       = ["10.70.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
}

resource "azurerm_subnet" "aks" { name = "aks"  resource_group_name = var.rg  virtual_network_name = azurerm_virtual_network.this.name  address_prefixes = ["10.70.1.0/22"] }
resource "azurerm_subnet" "db"  { name = "db"   resource_group_name = var.rg  virtual_network_name = azurerm_virtual_network.this.name  address_prefixes = ["10.70.5.0/24"] }
resource "azurerm_subnet" "hsm" { name = "hsm"  resource_group_name = var.rg  virtual_network_name = azurerm_virtual_network.this.name  address_prefixes = ["10.70.6.0/24"] }

variable "rg"       { type = string }
variable "location" { type = string }
output "aks_subnet_id" { value = azurerm_subnet.aks.id }
output "db_subnet_id"  { value = azurerm_subnet.db.id }
output "hsm_subnet_id" { value = azurerm_subnet.hsm.id }
