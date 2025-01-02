locals {
  user_from_yaml = yamldecode(file("${path.module}/user-roles.yml")).users
  user_map = {
    for users in local.user_from_yaml : users.username => users.roles...
  }
  flatten_user_map = {
    for user, roles in local.user_map : user => flatten(roles)  
  }
}