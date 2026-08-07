variable "location" {
  type        = string
  description = "Location of the Document AI processor"
  default     = "eu"

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "var.location must be a non-empty string"
  }
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

  validation {
    condition     = length(trimspace(var.type)) > 0
    error_message = "var.type must be a non-empty string"
  }
}

variable "kms_key_name" {
  type        = string
  description = "Resource name of the Cloud KMS key used to encrypt the Document AI processor (CMEK)"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "var.kms_key_name must be a non-empty string"
  }
}
