output "cluster_name"        { value = module.eks.cluster_name }
output "cluster_endpoint"    { value = module.eks.cluster_endpoint }
output "origin_bucket"       { value = module.s3_origin.bucket_name }
output "cloudfront_domain"   { value = module.cloudfront.domain_name }
output "mediaconvert_endpoint" { value = module.mediaconvert.endpoint }
output "cloudhsm_cluster_id" { value = module.cloudhsm.cluster_id }
