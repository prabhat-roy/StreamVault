data "aws_iam_policy_document" "irsa_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }
  }
}

resource "aws_iam_role" "drm_service" {
  name               = "streamvault-drm"
  assume_role_policy = data.aws_iam_policy_document.irsa_assume.json
}

resource "aws_iam_role" "transcoding" {
  name               = "streamvault-transcoding"
  assume_role_policy = data.aws_iam_policy_document.irsa_assume.json
}

resource "aws_iam_role" "mediaconvert" {
  name               = "streamvault-mediaconvert-job"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Principal = { Service = "mediaconvert.amazonaws.com" }, Action = "sts:AssumeRole" }]
  })
}

variable "oidc_provider_arn" { type = string }
output "mediaconvert_role_arn" { value = aws_iam_role.mediaconvert.arn }
