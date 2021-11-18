locals {
  tags = {
    "env" = var.env
  }
}

module "dynamodb" {
  source = "../../modules/dynamodb_table"
  env = var.env
  tags = local.tags
}
