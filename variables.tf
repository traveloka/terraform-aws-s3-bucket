variable "region" {
  description = "Region of this bucket resides in"
  type        = "string"
}

variable "product_domain" {
  description = "Product domain abbreviation this bucket belongs to"
  type        = "string"
}

variable "environment" {
  description = "Environment of this bucket resides in"
  type        = "string"
}

variable "description" {
  description = "Description of what this bucket used for"
  type        = "string"
}

variable "bucket_prefix" {
  description = "Bucket prefix of this bucket"
  type        = "string"
}

variable "bucket_acl" {
  default     = "private"
  description = "Bucket ACL of this bucket"
  type        = "string"
}

variable "logging_bucket" {
  description = "Logging bucket used for this bucket"
  type        = "string"
}

variable "sse_algorithm" {
  description = "Encryption algorithm used for this bucket"
  default     = "AES256"
  type        = "string"
}

variable "enable_versioning" {
  description = "Enable versioning for this bucket"
  default     = "True"
  type        = "string"
}
