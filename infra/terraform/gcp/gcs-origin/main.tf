resource "google_storage_bucket" "origin" {
  name          = "streamvault-origin-prod"
  location      = "EU"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition { age = 30 }
    action    { type = "SetStorageClass", storage_class = "NEARLINE" }
  }
  lifecycle_rule {
    condition { age = 180 }
    action    { type = "SetStorageClass", storage_class = "COLDLINE" }
  }
}

output "bucket" { value = google_storage_bucket.origin.name }
