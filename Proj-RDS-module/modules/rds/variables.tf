#########################
#General information
#########################

variable "project_name" {
  type        = string
  description = "Name of the project"
}
#########################
#DB information
#########################
variable "instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "instance class will be in free tier"
  validation {
    condition     = contains(["db.t3.micro"], var.instance_class)
    error_message = "Only db t2 micro is allowed"
  }
}

variable "storage_size" {
  type        = number
  default     = "10"
  description = "size will be between 5 to 10"
  validation {
    condition     = var.storage_size >= 5 && var.storage_size <= 10
    error_message = "size will be between 5 to 10"
  }
}

variable "engine" {
  type        = string
  default     = "postgress-latest"
  description = "only postgress is allowed"
  validation {
    condition     = contains(["postgress-latest", "postgress-14"], var.engine)
    error_message = "only postgress is allowed"
  }

}
#########################
#DB credentials
#########################
variable "credentials" {
  type = object({
    username = string
    password = string
  })
  description = "username & password for DB"
  sensitive   = true

  validation {
    condition = (
      length(regexall("[a-zA-Z]+", var.credentials.password)) > 0
      && length(regexall("[0-9]+", var.credentials.password)) > 0
      && length(regexall("^[a-zA-Z0-9+?_-]{6,}$", var.credentials.password)) > 0
    )
    error_message = <<-EOT
    password must 
    1. contain atleast 1 character &
    2. contains 1 digit 
    3. atleast 6 character long"
    4. contains only a-z A-Z 0-9 _-?+
    EOT
  }
}

#########################
#DB Network
#########################

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet to be attached to RDS"

}

variable "security_group_ids" {
  type        = list(string)
  description = "sg ids to be attached to RDS"
}