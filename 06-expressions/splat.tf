locals {
  #firstnames_from_splat = var.object_list[*].firstname
  firstnames_from_splat = toset(var.object_list)[*].firstname
  #roles_from_splat = [for k, v in local.users_map2 : v.role]
  roles_from_splat = values(local.users_map2)[*].role
}

output "firstnames_from_splat" {
  value = local.firstnames_from_splat
}
output "roles_from_splat" {
  value = local.roles_from_splat
}