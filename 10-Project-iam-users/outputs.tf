output "user-out" {
  value = local.user_from_yaml
}

output "password" {
  value     = { for user, user_login in aws_iam_user_login_profile.login : user => user_login.password }
  sensitive = true

}

output "policies" {
  value = local.role_policy_list
}

output "user_map" {
  value = local.flatten_user_map
}