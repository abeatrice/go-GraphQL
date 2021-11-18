provider "aws" {
  region  = var.region
  profile = var.profile
  endpoints {
    dynamodb = "http://localhost:4566"
    lambda   = "http://localhost:4566"
    kinesis  = "http://localhost:4566"
  }
}
