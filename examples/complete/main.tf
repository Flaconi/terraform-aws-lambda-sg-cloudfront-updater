provider "aws" {
  region = "eu-central-1"
}

module "terraform-aws-lamda-sg-cloudfront-updater" {
  source = "../../"
  name   = "functioname"
}
