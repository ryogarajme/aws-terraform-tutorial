output "account_id" {
  value = data.aws_caller_identity.current.*
}

output "region" {
  value = data.aws_region.current.*
}

output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "azs" {
  value = data.aws_availability_zones.available
}

output "iampolicy" {
  value = data.aws_iam_policy_document.static_website.json
}