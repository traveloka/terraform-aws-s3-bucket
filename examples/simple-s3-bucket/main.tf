data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
module "bucket" {
  source         = "../../"
  region         = "${data.aws_region.current.name}"
  product_domain = "my-product"
  environment    = "development"
  description    = "Simple S3 bucket"
  bucket_prefix  = "simple-bucket"
  logging_bucket = "default-s3-logs-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
}
