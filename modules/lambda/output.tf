output "lambda_arn" {
  value = aws_lambda_function.notify.qualified_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.notify.arn
}