variable "region" {
  type = "string"
}

variable "product_domain" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "bucket_prefix" {
  type = "string"
}

variable "logging_bucket" {
  type = "string"
}

variable "sse_algorithm" {
  default = "AES256"
  type    = "string"
}

variable "enable_versioning" {
  default = "True"
  type    = "string"
}

variable "bucket_policy" {
  type = "string"
}
