data "aws_caller_identity" "current" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "../../../main"
  output_path = "main.zip"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal = "apigateway.amazonaws.com"
  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.api.id}/*/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_lambda_function" "lambda" {
  filename = "function.zip"
  function_name = "graphql"
  role = aws_iam_role.role.arn
  handler = "main"
  source_code_hash = "data.archive_file.zip.output_base64sha256"
  runtime = "go1.x"
  memory_size = 128
  timeout = 10
}

resource "aws_iam_role" "role" {
  name = "graphql-lambda-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}
