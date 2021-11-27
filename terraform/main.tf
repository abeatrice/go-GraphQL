terraform {
  required_version = ">= 1.0.0"
}

locals {
  tags = {
    "env" = var.env
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
  dynamic "endpoints" {
    for_each = var.env == "dev" ? [1] : []
    content {
      dynamodb = "http://localhost:4566"
      lambda   = "http://localhost:4566"
      kinesis  = "http://localhost:4566"
      apigateway = "http://localhost:4566"
      iam = "http://localhost:4566"
      cloudwatch = "http://localhost:4566"
    }
  }
}

output "invoke_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}
