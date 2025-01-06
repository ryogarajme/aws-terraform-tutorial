output "vpc_id" {
  value = module.vpc.vpc_id
}

output "module_public_subnet" {
  value = module.vpc.public_subnets
}

output "module_private_subnet" {
  value = module.vpc.private_aubnets
}