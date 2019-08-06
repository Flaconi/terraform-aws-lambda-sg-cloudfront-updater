provider "aws" {
  alias = "default"
}

provider "aws" {
  alias = "sns"
}

data "aws_iam_policy_document" "lambda_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
      ]
    }
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name = "UpdateCloudfrontSG"
}

resource "aws_iam_role" "this" {
  name_prefix        = "lambda-cloudfront"
  assume_role_policy = data.aws_iam_policy_document.lambda_trust_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*"]

  }
  statement {
    actions = [
      "iam:GetRolePolicy",
      "iam:ListGroupPolicies",
      "ec2:DescribeSecurityGroups",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "lambda-cloudfront-policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.lambda_policy.json
}

data "archive_file" "this" {
  type        = "zip"
  source_file = "${path.module}/zip/index.py"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name    = "UpdateCloudFrontIps"
  filename         = "${path.module}/lambda.zip"
  source_code_hash = data.archive_file.this.output_base64sha256
  handler          = "index.lambda_handler"
  role             = aws_iam_role.this.arn
  runtime          = "python2.7"
  timeout          = 60
}

resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = "arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged"
}


resource "aws_sns_topic_subscription" "this" {
  provider  = "aws.sns"
  topic_arn = "arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged"
  protocol  = "lambda"
  endpoint  = aws_lambda_function.this.arn
}
