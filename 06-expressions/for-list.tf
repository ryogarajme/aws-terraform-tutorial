locals {
  double_number = [for n in var.numbers_list : n * 2]
  even_numbers  = [for n in var.numbers_list : n if n % 2 == 0]
  firstname     = [for p in var.object_list : p.firstname]
  fullname      = [for p in var.object_list : "${p.firstname} ${p.lastname}"]
}

output "doubles" {
  value = {
    double_number = local.double_number
    even_number   = local.even_numbers
    firstname     = local.firstname
    fullname      = local.fullname
  }

}