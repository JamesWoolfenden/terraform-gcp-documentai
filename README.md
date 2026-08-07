# terraform-gcp-documentai

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-documentai/workflows/Verify/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-documentai)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-documentai.svg)](https://github.com/JamesWoolfenden/terraform-gcp-documentai/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-documentai.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-documentai/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D1.5.0-blue.svg)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

Terraform module for a CMEK-encrypted Document AI processor. Exercises holden's `policies/gcp/document-ai` policy set.

## Usage

Add **module.documentai.tf** to your code:-

```terraform
module "documentai" {
  source       = "jameswoolfenden/documentai/gcp"
  version      = "0.0.1"
  location     = "eu"
  display_name = "example-processor"
  type         = "FORM_PARSER_PROCESSOR"
  kms_key_name = google_kms_crypto_key.docai.id
}
```

The referenced Cloud KMS key must be in the same location as the processor,
except for the `us` and `eu` multi-regions, which require the key in
`us-central1` and `europe-west4` respectively — see
[Document AI CMEK](https://docs.cloud.google.com/document-ai/docs/cmek). The
module itself grants the Document AI service agent
(`service-<PROJECT_NUMBER>@gcp-sa-prod-dai-core.iam.gserviceaccount.com`)
`roles/cloudkms.cryptoKeyEncrypterDecrypter` on the supplied key, so the
caller only needs to create the key and key ring.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google-beta_google_project_service_identity.documentai](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_project_service_identity) | resource |
| [google_document_ai_processor.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_processor) | resource |
| [google_kms_crypto_key_iam_member.documentai_service_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of the Document AI processor | `string` | n/a | yes |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | Resource name of the Cloud KMS key used to encrypt the Document AI processor (CMEK) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the Document AI processor | `string` | `"eu"` | no |
| <a name="input_type"></a> [type](#input\_type) | Document AI processor type, e.g. FORM\_PARSER\_PROCESSOR | `string` | `"FORM_PARSER_PROCESSOR"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | ID of the Document AI processor |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeys.getIamPolicy",
    "cloudkms.cryptoKeys.setIamPolicy",
    "documentai.processors.create",
    "documentai.processors.delete",
    "documentai.processors.get",
    "documentai.processors.update"
  ]
}

# plan role
resource "google_project_iam_custom_role" "terraform_pike_plan" {
  project     = "pike-477416"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "A user with least privileges"
  permissions = [
    "cloudkms.cryptoKeys.getIamPolicy",
    "documentai.processors.get"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-gcp-documentai/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-gcp-documentai/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2026 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
