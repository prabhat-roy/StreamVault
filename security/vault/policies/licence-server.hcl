# licence-server signs short-lived JWT licences using a key held in Vault.
path "transit/sign/licence-signing/sha2-256" {
  capabilities = ["update"]
}

path "transit/keys/licence-signing" {
  capabilities = ["read"]
}
