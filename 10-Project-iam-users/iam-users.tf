resource "aws_iam_user" "users" {
  for_each = toset(local.user_from_yaml[*].username)
  #for_each = toset([for users in local.user_from_yaml : users.username])
  name     = each.value
}

resource "aws_iam_user_login_profile" "login" {
  for_each        = aws_iam_user.users
  user            = each.value.name
  password_length = 8

  lifecycle {
    ignore_changes = [
      password_length,
      pgp_key,
      password_reset_required
    ]
  }
}