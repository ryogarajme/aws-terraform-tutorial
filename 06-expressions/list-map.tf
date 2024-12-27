locals {
  users_map = {
    for users in var.users : users.username => users.role...
  }
  users_map2 = {
    for username, roles in local.users_map : username => {
      role = roles
    }
  }
  usernames_from_map = [for username, roles in local.users_map : username]
}


locals {
  users_map_1 = {
    for users in var.users : users.username => { role = users.role }...
  }
}


output "users-map" {
  value = {
    users_map   = local.users_map
    users_map_1 = local.users_map_1
    users_map2  = local.users_map2
    str_roles   = local.users_map2["str"].role
  }

}

output "user_to-output" {
  value = local.users_map2[var.user_to_output].role
}

output "username" {
  value = local.usernames_from_map
}