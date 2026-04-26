data "aws_media_convert_endpoint" "this" {}

resource "aws_media_convert_queue" "this" {
  name = "streamvault-encoding"
  pricing_plan = "ON_DEMAND"
  status       = "ACTIVE"
}

resource "aws_media_convert_preset" "abr_1080p" {
  name        = "streamvault-abr-1080p-h264"
  category    = "streamvault"
  description = "Per-title 1080p ABR ladder, VMAF-targeted"
  settings_json = file("${path.module}/preset-1080p.json")
}

variable "role_arn" { type = string }
output "endpoint" { value = data.aws_media_convert_endpoint.this.url }
