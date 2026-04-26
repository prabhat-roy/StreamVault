# Vault Enterprise HSM auto-unseal + Transit key generation backed by PKCS#11.
# Master keys for DRM live ONLY inside the HSM. The Vault server never holds the
# raw master in memory — operations are forwarded to the HSM cryptoki module.

seal "pkcs11" {
  lib            = "/opt/cloudhsm/lib/libcloudhsm_pkcs11.so"
  slot           = "0"
  pin            = "file:///etc/vault/hsm-pin"
  key_label      = "vault-unseal"
  hmac_key_label = "vault-unseal-hmac"
  generate_key   = "false"
}

# Transit engine keys with HSM backing (DRM master keys).
# vault write transit/keys/drm-master \
#   type=aes256-gcm96 \
#   exportable=false \
#   allow_plaintext_backup=false \
#   derived=false
