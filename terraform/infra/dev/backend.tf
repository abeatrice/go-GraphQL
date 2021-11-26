provider "aws" {
  region  = var.region
  profile = var.profile
  # endpoints {
  #   dynamodb = "http://localhost:4566"
  #   lambda   = "http://localhost:4566"
  #   kinesis  = "http://localhost:4566"
  #   apigateway = "http://localhost:4566"
  #   iam = "http://localhost:4566"
  # }
}
