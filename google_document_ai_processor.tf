resource "google_document_ai_processor" "main" {
  location     = var.location
  display_name = var.display_name
  type         = var.type
  kms_key_name = var.kms_key_name

  depends_on = [google_kms_crypto_key_iam_member.documentai_service_agent]
}
