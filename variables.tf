variable "location" {
  type        = string
  description = "Location of the Document AI processor"
  default     = "eu"
}

variable "display_name" {
  type        = string
  description = "Display name of the Document AI processor"

  validation {
    condition     = length(trimspace(var.display_name)) > 0
    error_message = "var.display_name must be a non-empty string"
  }
}

variable "type" {
  type        = string
  description = "Document AI processor type, e.g. FORM_PARSER_PROCESSOR"
  default     = "FORM_PARSER_PROCESSOR"
}

variable "kms_key_name" {
  type        = string
  description = "KMS crypto key used to encrypt the Document AI processor's data"

  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "var.kms_key_name must be a non-empty string"
  }
}