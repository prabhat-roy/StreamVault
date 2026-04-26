# CloudHSM cluster — DRM master keys live here, never leave the HSM boundary.
resource "aws_cloudhsm_v2_cluster" "drm" {
  hsm_type   = "hsm1.medium"
  subnet_ids = var.subnet_ids
}

resource "aws_cloudhsm_v2_hsm" "primary" {
  cluster_id = aws_cloudhsm_v2_cluster.drm.cluster_id
  subnet_id  = var.subnet_ids[0]
}

resource "aws_cloudhsm_v2_hsm" "secondary" {
  cluster_id = aws_cloudhsm_v2_cluster.drm.cluster_id
  subnet_id  = var.subnet_ids[1]
}

variable "vpc_id"     { type = string }
variable "subnet_ids" { type = list(string) }
output "cluster_id" { value = aws_cloudhsm_v2_cluster.drm.cluster_id }
