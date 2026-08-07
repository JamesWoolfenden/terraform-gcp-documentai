resource "google_kms_crypto_key" "docai" {
  name            = "docai-key"
  key_ring        = google_kms_key_ring.docai.id
  rotation_period = "2592000s"

  lifecycle {
    prevent_destroy = true
  }
}
