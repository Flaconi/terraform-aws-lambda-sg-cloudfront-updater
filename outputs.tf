output "this_aws_lambda_function_arn" {
  description = "The arn of the lambda"
  value       = aws_lambda_function.this.arn
}
