module "bucket_name" {
  source        = "github.com/traveloka/terraform-aws-resource-naming?ref=v0.7.1"
  resource_type = "s3_bucket"
  name_prefix   = "${var.bucket_prefix}"
}

resource "aws_s3_bucket" "this" {
  bucket = "${module.bucket_name.name}"
  region = "${var.region}"
  acl    = "${var.bucket_acl}"

  logging {
    target_bucket = "${var.logging_bucket}"
    target_prefix = "${module.bucket_name.name}/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "${var.sse_algorithm}"
      }
    }
  }

  versioning {
    enabled = "${var.enable_versioning}"
  }

  tags {
    Name          = "${module.bucket_name.name}"
    Description   = "${var.description}"
    ProductDomain = "${var.product_domain}"
    Environment   = "${var.environment}"
    ManagedBy     = "Terraform"
  }
}