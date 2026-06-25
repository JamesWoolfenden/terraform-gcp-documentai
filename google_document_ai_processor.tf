# holden policy HLD_GCP_242 expects a top-level kms_key_name attribute on this
# resource; as of provider 7.31.0 google_document_ai_processor exposes no such
# field (CMEK for Document AI is configured at the location level via the API,
# not through this resource). Kept here unset deliberately — see fork report.
resource "google_document_ai_processor" "main" {
  location     = var.location
  display_name = var.display_name
  type         = var.type
}