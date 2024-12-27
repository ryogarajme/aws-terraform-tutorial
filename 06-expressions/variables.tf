variable "numbers_list" {
  type = list(number)
}

variable "numbers_maps" {
  type = map(number)
}

variable "object_list" {
  type = list(object({
    firstname = string
    lastname  = string
  }))
}

variable "users" {
  type = list(object({
    username = string
    role     = string
  }))
}

variable "user_to_output" {
  type = string
}
