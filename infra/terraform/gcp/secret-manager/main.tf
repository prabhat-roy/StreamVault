resource "google_secret_manager_secret" "rds" {
  secret_id = "streamvault-cloudsql-subscription"
  replication { auto {} }
}

resource "google_secret_manager_secret" "kafka" {
  secret_id = "streamvault-kafka-sasl"
  replication { auto {} }
}

# DRM keys are NOT created here. They live in Cloud HSM only.
