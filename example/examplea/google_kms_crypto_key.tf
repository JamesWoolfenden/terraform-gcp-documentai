resource "google_kms_crypto_key" "docai" {
  name     = "docai-key"
  key_ring = google_kms_key_ring.docai.id

  lifecycle {
    prevent_destroy = true
  }
}
