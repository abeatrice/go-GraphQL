resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/graphql"
  retention_in_days = 14
}

resource "aws_iam_policy" "log_policy" {
  name = "graphql_logging"
  path = "/"
  description = "IAM policy for logging graphql lambda"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role = aws_iam_role.role.name
  policy_arn = aws_iam_policy.log_policy.arn
}
