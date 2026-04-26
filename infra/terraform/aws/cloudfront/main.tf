resource "aws_cloudfront_distribution" "origin" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = "PriceClass_All"

  origin {
    domain_name = var.origin_bucket
    origin_id   = "s3-origin"
    s3_origin_config { origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path }
  }

  default_cache_behavior {
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    forwarded_values { query_string = false  cookies { forward = "none" } }
  }

  ordered_cache_behavior {
    path_pattern           = "*.m3u8"
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    min_ttl                = 0
    default_ttl            = 2
    max_ttl                = 5
    forwarded_values { query_string = true  cookies { forward = "none" } }
  }

  restrictions { geo_restriction { restriction_type = "none" } }
  viewer_certificate { cloudfront_default_certificate = true }
}

resource "aws_cloudfront_origin_access_identity" "this" { comment = "streamvault-origin-oai" }

variable "origin_bucket" { type = string }
output "domain_name" { value = aws_cloudfront_distribution.origin.domain_name }
