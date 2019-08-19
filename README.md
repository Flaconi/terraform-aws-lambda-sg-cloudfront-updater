# Microservice Boilerplate

[![Build Status](https://travis-ci.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater.svg?branch=master)](https://travis-ci.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater)
[![Tag](https://img.shields.io/github/tag/Flaconi/terraform-aws-lamda-sg-cloudfront-updater.svg)](https://github.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This Terraform module creates a lambda which automatically updates security groups to allow cloudfront IP Ranges

# Tags which identify the security groups you want to update
SECURITY_GROUP_TAG_FOR_GLOBAL_HTTP = { 'Name': 'cloudfront_g', 'AutoUpdate': 'true', 'Protocol': 'http' }
SECURITY_GROUP_TAG_FOR_GLOBAL_HTTPS = { 'Name': 'cloudfront_g', 'AutoUpdate': 'true', 'Protocol': 'https' }
SECURITY_GROUP_TAG_FOR_REGION_HTTP = { 'Name': 'cloudfront_r', 'AutoUpdate': 'true', 'Protocol': 'http' }
SECURITY_GROUP_TAG_FOR_REGION_HTTPS = { 'Name': 'cloudfront_r', 'AutoUpdate': 'true', 'Protocol': 'https' }

## Examples

### Example

```hcl

module "terraform-aws-lamda-sg-cloudfront-updater" {
  source = "../../"
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the lambda function | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| this\_aws\_lambda\_function\_arn | The arn of the lambda |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## License

[MIT](LICENSE)

Copyright (c) 2019 [Flaconi GmbH](https://github.com/Flaconi)
