module "instance_profile" {
  source  = "github.com/traveloka/terraform-aws-iam-role.git//modules/instance"
  version = "v0.3.0"

  service_name = "tsiadts"
  cluster_role = "app"
}

data "aws_iam_policy_document" "test_policy" {
  # ensure you have this statement to enforce secure transport
  statement {
    sid    = "ForceSSLOnlyAccess"
    effect = "Deny"

    principals {
      identifiers = [
        "${module.instance_profile.role_arn}",
      ]

      type = "AWS"
    }

    actions = [
      "s3:GetObject",
    ]

    condition {
      test = "Bool"

      values = [
        "false",
      ]

      variable = "aws:SecureTransport"
    }

    resources = [
      "${module.s3_bucket.bucket_arn}/*",
    ]
  }
}

resource "aws_s3_bucket" "test_logging" {
  bucket = "sample-logging-test"
  acl    = "log-delivery-write"
}

module "s3_bucket" {
  source = "../.."

  bucket_prefix  = "tsi-archive-data"
  region         = "ap-southeast-1"
  description    = "sample data"
  product_domain = "tsi"
  environment    = "dev"

  bucket_acl        = "private"
  enable_versioning = "True"
  logging_bucket    = "${aws_s3_bucket.test_logging.bucket}"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = "${module.s3_bucket.bucket_name}"
  policy = "${data.aws_iam_policy_document.test_policy.json}"
}
