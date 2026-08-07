resource "google_project_service_identity" "documentai" {
  provider = google-beta
  service  = "documentai.googleapis.com"
}
