# terraform-gcp-documentai

Terraform module for Document AI. Exercises holden's `policies/gcp/document-ai` policy set.

Note: `policies/gcp/document-ai/processor-cmek.yaml` (HLD_GCP_242) checks for
a `kms_key_name` attribute on `google_document_ai_processor` that does not
exist in the `hashicorp/google` provider schema, and
`warehouse-location-cmek.yaml` (HLD_GCP_243) targets
`google_document_ai_warehouse_location`, which is not a resource type the
provider implements at all. Both look like holden policy bugs — see the gap
log.