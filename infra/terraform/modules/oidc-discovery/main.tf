# Discovers the OIDC issuer URL of an EKS / GKE / AKS cluster so that downstream
# IRSA / Workload Identity / Pod Identity bindings can be wired without hardcoding.
variable "cloud"   { type = string }
variable "cluster" { type = string }
output "issuer_url_hint" { value = "Provided by per-cloud module's output (eks/gke/aks)" }
