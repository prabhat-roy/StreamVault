resource "google_compute_backend_bucket" "origin" {
  name        = "streamvault-origin-cdn"
  bucket_name = var.backend_bucket
  enable_cdn  = true
  cdn_policy {
    cache_mode  = "USE_ORIGIN_HEADERS"
    default_ttl = 3600
    max_ttl     = 86400
  }
}

resource "google_compute_url_map" "this" {
  name            = "streamvault-cdn"
  default_service = google_compute_backend_bucket.origin.id
}

variable "backend_bucket" { type = string }
output "url_map" { value = google_compute_url_map.this.name }
