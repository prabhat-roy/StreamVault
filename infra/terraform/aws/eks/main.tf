module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "streamvault-prod"
  cluster_version = "1.30"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  enable_irsa = true

  eks_managed_node_groups = {
    platform = {
      instance_types = ["m6i.xlarge"]
      min_size       = 3
      max_size       = 30
      desired_size   = 6
    }
    transcoding_gpu_spot = {
      instance_types = ["g5.2xlarge"]
      capacity_type  = "SPOT"
      min_size       = 0
      max_size       = 200
      desired_size   = 0
      labels = { "node-role.streamvault.io/gpu" = "true" }
      taints = [{ key = "nvidia.com/gpu", value = "true", effect = "NO_SCHEDULE" }]
    }
    packager_low_latency = {
      instance_types = ["c6in.2xlarge"]
      min_size       = 4
      max_size       = 60
      desired_size   = 6
      labels = { "node-role.streamvault.io/packager" = "true" }
    }
  }
}

variable "vpc_id"     { type = string }
variable "subnet_ids" { type = list(string) }

output "cluster_name"      { value = module.eks.cluster_name }
output "cluster_endpoint"  { value = module.eks.cluster_endpoint }
output "oidc_provider_arn" { value = module.eks.oidc_provider_arn }
