resource "aws_s3_bucket" "origin" {
  bucket = "streamvault-origin-prod"
}

resource "aws_s3_bucket_versioning" "origin" {
  bucket = aws_s3_bucket.origin.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_lifecycle_configuration" "origin" {
  bucket = aws_s3_bucket.origin.id
  rule {
    id     = "ia-then-glacier"
    status = "Enabled"
    transition { days = 30  storage_class = "STANDARD_IA" }
    transition { days = 180 storage_class = "GLACIER" }
  }
}

output "bucket_name"   { value = aws_s3_bucket.origin.id }
output "bucket_domain" { value = aws_s3_bucket.origin.bucket_regional_domain_name }
