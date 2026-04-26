resource "google_compute_network" "this" {
  name                    = "streamvault"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "primary" {
  name          = "streamvault-primary"
  ip_cidr_range = "10.50.0.0/20"
  region        = "europe-west4"
  network       = google_compute_network.this.id
  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.60.0.0/14"
  }
  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.64.0.0/20"
  }
}

output "network" { value = google_compute_network.this.name }
output "subnet"  { value = google_compute_subnetwork.primary.name }
