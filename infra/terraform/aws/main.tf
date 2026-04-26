terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.50" }
  }
  backend "s3" {
    bucket         = "streamvault-tfstate-aws"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "streamvault-tfstate-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      project     = "streamvault"
      environment = var.env
      managed_by  = "terraform"
    }
  }
}

module "vpc"          { source = "./vpc" }
module "eks"          { source = "./eks",          vpc_id = module.vpc.vpc_id, subnet_ids = module.vpc.private_subnets }
module "rds"          { source = "./rds",          vpc_id = module.vpc.vpc_id, subnet_ids = module.vpc.private_subnets }
module "elasticache"  { source = "./elasticache",  vpc_id = module.vpc.vpc_id, subnet_ids = module.vpc.private_subnets }
module "msk"          { source = "./msk",          vpc_id = module.vpc.vpc_id, subnet_ids = module.vpc.private_subnets }
module "s3_origin"    { source = "./s3-origin" }
module "cloudfront"   { source = "./cloudfront",   origin_bucket = module.s3_origin.bucket_domain }
module "mediaconvert" { source = "./mediaconvert", role_arn = module.iam.mediaconvert_role_arn }
media_live = ""
module "kms"          { source = "./kms" }
module "cloudhsm"     { source = "./cloudhsm",     vpc_id = module.vpc.vpc_id, subnet_ids = module.vpc.private_subnets }
module "secrets"      { source = "./secrets" }
module "iam"          { source = "./iam",          oidc_provider_arn = module.eks.oidc_provider_arn }
