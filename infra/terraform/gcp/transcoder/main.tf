# Transcoder API service is enabled at the project level; per-job templates live in src/media/transcoding-service.
resource "google_project_service" "transcoder" {
  service = "transcoder.googleapis.com"
}
