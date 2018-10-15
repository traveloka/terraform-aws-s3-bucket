output "bucket_name" {
  value = "${aws_s3_bucket.this.bucket}"
}

output "bucket_arn" {
  value = "${aws_s3_bucket.this.arn}"
}

output "region" {
  value = "${aws_s3_bucket.this.region}"
}

output "acl" {
  value = "${aws_s3_bucket.this.acl}"
}

output "sse_algorithm" {
  value = "${var.sse_algorithm}"
}

output "versioning_enabled" {
  value = "${var.enable_versioning}"
}

output "logging_bucket" {
  value = "${var.logging_bucket}"
}
