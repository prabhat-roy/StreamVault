resource "google_kms_key_ring" "envelope" {
  name     = "streamvault-envelope"
  location = "europe-west4"
}

resource "google_kms_crypto_key" "envelope" {
  name     = "envelope"
  key_ring = google_kms_key_ring.envelope.id
  rotation_period = "7776000s"
}
