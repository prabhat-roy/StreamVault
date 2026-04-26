resource "aws_kms_key" "envelope" {
  description             = "Envelope key for app secrets, NOT DRM master keys"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}

resource "aws_kms_alias" "envelope" {
  name          = "alias/streamvault-envelope"
  target_key_id = aws_kms_key.envelope.id
}
