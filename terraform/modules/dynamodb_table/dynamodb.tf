resource "aws_dynamodb_table" "placements" {
  name = "${var.env}-Placements"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = var.tags
}
