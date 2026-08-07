resource "google_kms_key_ring" "docai" {
  name     = "docai-keyring"
  location = "europe-west4"
}
