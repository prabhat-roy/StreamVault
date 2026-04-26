# Cloud HSM keyring — DRM master keys live here, key material never leaves HSM.
resource "google_kms_key_ring" "drm_hsm" {
  name     = "streamvault-drm"
  location = "europe-west4"
}

resource "google_kms_crypto_key" "drm_master" {
  name             = "drm-master"
  key_ring         = google_kms_key_ring.drm_hsm.id
  purpose          = "ENCRYPT_DECRYPT"
  rotation_period  = "2592000s"
  version_template { algorithm = "GOOGLE_SYMMETRIC_ENCRYPTION" protection_level = "HSM" }
}
