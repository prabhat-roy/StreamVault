# drm-service may READ wrapped key material via Transit, never raw master keys.
# Master keys are HSM-backed and addressable only by the Vault Transit engine.

path "transit/decrypt/drm-master" {
  capabilities = ["update"]
}

path "transit/encrypt/drm-master" {
  capabilities = ["update"]
}

path "transit/keys/drm-master" {
  capabilities = ["read"]
}

# Explicitly DENY raw key export — even by Vault admins.
path "transit/export/encryption-key/drm-master" {
  capabilities = ["deny"]
}
