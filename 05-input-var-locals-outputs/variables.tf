# variable "aws_region" {
#   type = string
# }

variable "instance_type" {
  type = string
  #default     = "t2.micro"
  description = "type of the ec2 instance type"
  validation {
    #condition = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    #condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    condition = startswith(var.instance_type, "t3")
    error_message = "Please enter the valid instance type Allowed Values are t2.micro or t3.micro"
  }
}

# variable "volume_size" {
#   type        = number
#   default     = "10"
#   description = "size of the volume that you required"
# }

# variable "volume_type" {
#   type        = string
#   default     = "gp3"
#   description = "use either gp2 or gp3"
# }

variable "root_block_device" {
  type = object({
    volume_size = number
    volume_type = string
  })
  description = "size & type of root block device"
  default = {
    volume_size = 10
    volume_type = "gp3"
  }
}

# variable "root_block_device" {
#   type = map(object({
#     volume_size = number
#     volume_type = string
#   }))
#   description = "size & type of root block device"
#   default = {
#     config = {
#       volume_size = 10
#       volume_type = "gp3"
#   } }
# }

variable "additional_tags" {
  type = map(string)
  default = {
  }
}