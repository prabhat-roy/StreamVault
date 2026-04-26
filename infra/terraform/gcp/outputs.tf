output "cluster_name"     { value = module.gke.cluster_name }
output "cluster_endpoint" { value = module.gke.endpoint }
output "origin_bucket"    { value = module.gcs_origin.bucket }
output "cdn_url_map"      { value = module.cloud_cdn.url_map }
