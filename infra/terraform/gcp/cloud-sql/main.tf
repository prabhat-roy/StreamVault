resource "google_sql_database_instance" "subscription" {
  name             = "streamvault-subscription"
  database_version = "POSTGRES_16"
  region           = "europe-west4"
  settings {
    tier              = "db-custom-4-16384"
    availability_type = "REGIONAL"
    backup_configuration { enabled = true point_in_time_recovery_enabled = true }
    ip_configuration  { private_network = "projects/streamvault/global/networks/${var.network}" }
  }
  deletion_protection = true
}

variable "network" { type = string }
