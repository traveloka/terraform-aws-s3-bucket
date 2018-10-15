resource "aws_s3_bucket" "test_logging" {
  bucket = "sample-logging-test"
  acl    = "log-delivery-write"
}

data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "test_policy" {
  "statement" {
    actions = [
      "s3:ListBucket",
    ]

    effect = "Allow"

    principals {
      identifiers = ["${data.aws_caller_identity.this.arn}"]
      type        = "AWS"
    }

    resources = ["${module.s3_bucket.bucket_arn}/"]
  }
}

module "s3_bucket" {
  source = "../.."

  bucket_prefix  = "tsi-archive-data"
  region         = "ap-southeast-1"
  description    = "sample data"
  product_domain = "tsi"
  environment    = "dev"

  logging_bucket = "${aws_s3_bucket.test_logging.bucket}"

  bucket_policy = "${data.aws_iam_policy_document.test_policy.json}"
}
