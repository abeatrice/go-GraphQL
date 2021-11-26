output "placements_arn" {
  value = module.dynamodb.placements_arn
}

output "invoke_url" {
  value = module.function.invoke_url
}
