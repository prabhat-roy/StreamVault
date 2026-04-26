resource "google_container_cluster" "primary" {
  name     = "streamvault-prod"
  location = "europe-west4"
  network  = var.network
  subnetwork = var.subnet
  remove_default_node_pool = true
  initial_node_count       = 1
  workload_identity_config { workload_pool = "${data.google_project.this.project_id}.svc.id.goog" }
  release_channel { channel = "REGULAR" }
}

data "google_project" "this" {}

resource "google_container_node_pool" "platform" {
  name       = "platform"
  cluster    = google_container_cluster.primary.id
  node_count = 6
  node_config {
    machine_type = "e2-standard-4"
    workload_metadata_config { mode = "GKE_METADATA" }
  }
  autoscaling { min_node_count = 3 max_node_count = 30 }
}

resource "google_container_node_pool" "transcoding_gpu_spot" {
  name    = "transcoding-gpu-spot"
  cluster = google_container_cluster.primary.id
  node_count = 0
  node_config {
    machine_type = "n1-standard-8"
    spot         = true
    guest_accelerator { type = "nvidia-tesla-t4" count = 1 }
    workload_metadata_config { mode = "GKE_METADATA" }
    labels = { "node-role.streamvault.io/gpu" = "true" }
    taint { key = "nvidia.com/gpu" value = "true" effect = "NO_SCHEDULE" }
  }
  autoscaling { min_node_count = 0 max_node_count = 200 }
}

variable "network" { type = string }
variable "subnet"  { type = string }
output "cluster_name" { value = google_container_cluster.primary.name }
output "endpoint"     { value = google_container_cluster.primary.endpoint }
