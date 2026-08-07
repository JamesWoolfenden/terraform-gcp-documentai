resource "google_document_ai_processor" "main" {
  location     = var.location
  display_name = var.display_name
  type         = var.type
  kms_key_name = var.kms_key_name
}
