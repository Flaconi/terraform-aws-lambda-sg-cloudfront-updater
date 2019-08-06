provider "aws" {
  region = "eu-central-1"
}
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
