terraform {
  required_version = ">= 1.6.0"
  required_providers { google = { source = "hashicorp/google", version = "~> 5.40" } }
  backend "gcs" {
    bucket = "streamvault-tfstate-gcp"
    prefix = "prod"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

module "vpc"          { source = "./vpc" }
module "gke"          { source = "./gke",          network = module.vpc.network, subnet = module.vpc.subnet }
module "cloud_sql"    { source = "./cloud-sql",    network = module.vpc.network }
module "memorystore"  { source = "./memorystore",  network = module.vpc.network }
module "pubsub"       { source = "./pubsub" }
module "gcs_origin"   { source = "./gcs-origin" }
module "cloud_cdn"    { source = "./cloud-cdn",    backend_bucket = module.gcs_origin.bucket }
module "transcoder"   { source = "./transcoder" }
module "kms"          { source = "./kms" }
module "cloud_hsm"    { source = "./cloud-hsm" }
module "secret_mgr"   { source = "./secret-manager" }
