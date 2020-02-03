# terraform-aws-s3-bucket

[![Terraform Version](https://img.shields.io/badge/Terraform%20Version->=0.11.14,_<0.12.0-blue.svg)](https://releases.hashicorp.com/terraform/)
[![Release](https://img.shields.io/github/release/traveloka/terraform-aws-s3-bucket.svg)](https://github.com/traveloka/terraform-aws-s3-bucket/releases)
[![Last Commit](https://img.shields.io/github/last-commit/traveloka/terraform-aws-s3-bucket.svg)](https://github.com/traveloka/terraform-aws-s3-bucket/commits/master)
[![Issues](https://img.shields.io/github/issues/traveloka/terraform-aws-s3-bucket.svg)](https://github.com/traveloka/terraform-aws-s3-bucket/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/traveloka/terraform-aws-s3-bucket.svg)](https://github.com/traveloka/terraform-aws-s3-bucket/pulls)
[![License](https://img.shields.io/github/license/traveloka/terraform-aws-s3-bucket.svg)](https://github.com/traveloka/terraform-aws-s3-bucket/blob/master/LICENSE)
![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)

## Table of Content

- [Prerequisites](#Prerequisites)
- [Quick Start](#Quick-Start)
- [Dependencies](#Dependencies)
- [Contributing](#Contributing)
- [Contributor](#Contributor)
- [License](#License)
- [Acknowledgments](#Acknowledgments)

## Prerequisites

- [Terraform](https://releases.hashicorp.com/terraform/). This module currently tested on `0.11.14`

## Quick Start
Terraform module to create S3 bucket

### Examples

* [Simple S3 Bucket](https://github.com/traveloka/terraform-aws-s3-bucket/tree/master/examples/simple-s3-bucket)

### Module
- terraform-aws-resource-naming 

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | >= 1.1, < 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| region | Region name to place the S3 bucket | `string` | n/a | yes |
| product\_domain | Product domain these resources belong to. | `string` | n/a | yes |
| environment | Type of environment these resources belong to. | `string` | n/a | yes |
| description | Description of what this bucket used for. | `string` | n/a | yes |
| bucket\_prefix | Bucket prefix of this bucket. | `string` | n/a | yes |
| bucket\_acl | Bucket ACL of this bucket. | `string` | `private` | no |
| logging\_bucket | Logging bucket used for this bucket. | `string` | n/a | yes |
| sse\_algorithm | Encryption algorithm used for this bucket. | `string` | `AES256` | no |
| enable_versioning | Enable versioning for this bucket. | `string` | `True` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_name | Created bucket name. |
| bucket_arn | Created bucket ARN. |
| region | The name of the selected region. |
| acl | The acl of the bucket. |
| sse_algorithm | SSE Algorithm for the created bucket. |
| versioning_enabled | Bucket versioning status. |
| logging_bucket | Bucket name for logging. |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

Apache 2 Licensed. See LICENSE for full details.

## Acknowledgement
