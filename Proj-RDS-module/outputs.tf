output "rds" {
  value = module.rds.rds_endpoint_url
}

output "rds_address" {
  value = module.rds.rds_address
}