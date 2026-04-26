resource "azurerm_kubernetes_cluster" "this" {
  name                = "streamvault-prod"
  location            = var.location
  resource_group_name = var.rg
  dns_prefix          = "streamvault"
  kubernetes_version  = "1.30"

  default_node_pool {
    name                = "platform"
    vm_size             = "Standard_D4ds_v5"
    node_count          = 6
    min_count           = 3
    max_count           = 30
    enable_auto_scaling = true
    vnet_subnet_id      = var.subnet_id
  }

  identity { type = "SystemAssigned" }
  workload_identity_enabled = true
  oidc_issuer_enabled       = true
}

resource "azurerm_kubernetes_cluster_node_pool" "gpu_spot" {
  name                  = "gpuspot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_NC6s_v3"
  priority              = "Spot"
  eviction_policy       = "Delete"
  spot_max_price        = -1
  enable_auto_scaling   = true
  min_count             = 0
  max_count             = 200
  node_count            = 0
  node_labels           = { "node-role.streamvault.io/gpu" = "true" }
  node_taints           = ["nvidia.com/gpu=true:NoSchedule"]
}

variable "rg"        { type = string }
variable "location"  { type = string }
variable "subnet_id" { type = string }
output "cluster_name" { value = azurerm_kubernetes_cluster.this.name }
