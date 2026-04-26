output "cluster_name" { value = module.aks.cluster_name }
output "front_door_endpoint" { value = module.front_door.endpoint }
output "blob_origin"  { value = module.blob_origin.account_name }
output "key_vault"    { value = module.key_vault.vault_uri }
output "hsm_uri"      { value = module.dedicated_hsm.uri }
