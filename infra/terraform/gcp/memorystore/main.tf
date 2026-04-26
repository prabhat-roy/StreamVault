resource "google_redis_instance" "session" {
  name               = "streamvault-session"
  tier               = "STANDARD_HA"
  memory_size_gb     = 16
  region             = "europe-west4"
  redis_version      = "REDIS_7_0"
  authorized_network = "projects/streamvault/global/networks/${var.network}"
  transit_encryption_mode = "SERVER_AUTHENTICATION"
}

variable "network" { type = string }
