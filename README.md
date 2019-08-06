# Microservice Boilerplate

[![Build Status](https://travis-ci.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater.svg?branch=master)](https://travis-ci.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater)
[![Tag](https://img.shields.io/github/tag/Flaconi/terraform-aws-lamda-sg-cloudfront-updater.svg)](https://github.com/Flaconi/terraform-aws-lamda-sg-cloudfront-updater/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

This Terraform module creates a lambda which automatically updates security groups to allow cloudfront IP Ranges

# Tags which identify the security groups you want to update
SECURITY_GROUP_TAG_FOR_GLOBAL_HTTP = { 'cloudfront': 'cloudfront_g', 'AutoUpdate': 'true', 'Protocol': 'http' }
SECURITY_GROUP_TAG_FOR_GLOBAL_HTTPS = { 'cloudfront': 'cloudfront_g', 'AutoUpdate': 'true', 'Protocol': 'https' }
SECURITY_GROUP_TAG_FOR_REGION_HTTP = { 'cloudfront': 'cloudfront_r', 'AutoUpdate': 'true', 'Protocol': 'http' }
SECURITY_GROUP_TAG_FOR_REGION_HTTPS = { 'cloudfront': 'cloudfront_r', 'AutoUpdate': 'true', 'Protocol': 'https' }

## Examples

### Example

```hcl
provider "aws" {}
provider "aws" {
  region = "us-east-1"
  alias  = "sns"
}


module "terraform-aws-lamda-sg-cloudfront-updater" {
  source = "../../"
  providers = {
    aws.default = "aws"
    aws.sns     = "aws.sns"
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## License

[MIT](LICENSE)

Copyright (c) 2019 [Flaconi GmbH](https://github.com/Flaconi)
