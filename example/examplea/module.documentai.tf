# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "documentai" {
  source       = "../../"
  location     = "eu"
  display_name = "example-processor"
  type         = "FORM_PARSER_PROCESSOR"
  kms_key_name = google_kms_crypto_key.docai.id
}
