output "region" {
  value = "${module.s3_bucket.region}"
}

output "bucket_name" {
  value = "${module.s3_bucket.bucket_name}"
}

output "acl" {
  value = "${module.s3_bucket.acl}"
}

output "sse_algorithm" {
  value = "${module.s3_bucket.sse_algorithm}"
}

output "versioning_enabled" {
  value = "${module.s3_bucket.versioning_enabled}"
}

output "logging_bucket" {
  value = "${module.s3_bucket.logging_bucket}"
}