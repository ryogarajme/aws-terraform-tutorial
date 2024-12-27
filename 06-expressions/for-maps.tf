locals {
  doubles_map = {
    for k, v in var.numbers_maps : k => v * 2
  }
  even_map = {
    for k, v in var.numbers_maps : k => v if v % 2 == 0
  }
}

output "for-maps" {
  value = {
    doubles_map = local.doubles_map
    even_map    = local.even_map
  }
}