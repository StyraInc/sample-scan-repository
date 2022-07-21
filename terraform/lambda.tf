resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/lambda-function-public-access-prohibited"
  retention_in_days = 30
}

resource "aws_apigatewayv2_api" "lambda_api" {
  name          = "lambdaTestAPI"
  protocol_type = "HTTP"
}

resource "aws_lambda_function" "sample_app" {
  function_name = "LambdaSampleApp"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_role.arn

  filename     = "lambda.zip"
  package_type = "Zip"
  handler      = "index.handler"
  memory_size  = 128
  timeout      = 3
}

resource "aws_lambda_permission" "permissions" {
  statement_id  = "AllowExecutionFromAPIGW"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  function_name = aws_lambda_function.sample_app.function_name
  source_arn    = "${aws_apigatewayv2_api.lambda_api.arn}/*/*/*"
}
