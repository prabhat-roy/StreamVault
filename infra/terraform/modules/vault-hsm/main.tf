# Reusable abstraction over CloudHSM / Cloud HSM / Dedicated HSM.
# Concrete implementations live in the per-cloud directories; this module documents
# the contract. DRM master keys NEVER live outside the HSM boundary.
variable "cloud"     { type = string }
variable "key_label" { type = string }
output "guidance" {
  value = "Use cloud-specific HSM module: aws/cloudhsm, gcp/cloud-hsm, azure/dedicated-hsm. App services must talk to the HSM via PKCS#11 or vendor SDK."
}
