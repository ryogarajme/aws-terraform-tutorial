locals {
  name = "yogaraj"
  age  = -30
  my_object = {
    key1 = 10
    key2 = "ynr"
  }
}

output "name" {
  value = startswith(lower(local.name), "y")
}

output "age" {
  value = pow(local.age, 2)
}

output "file" {
  value = yamldecode(file("${path.module}/users.yml")).users[*].name
  #value = file("${path.module}/users.yaml")

}

output "ex4" {
  value = jsonencode(local.my_object)
  #value = yamlencode(local.my_object)

}