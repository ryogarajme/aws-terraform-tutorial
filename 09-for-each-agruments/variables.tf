variable "subnet_config" {
  type = map(object({
    cidr_block = string
  }))

  validation {
    error_message = "Cidr blocks are not valid"
    condition = alltrue([
      for cidr in values(var.subnet_config) : can(cidrnetmask(cidr.cidr_block))
    ])
}
}

variable "instance_type" {
  type = string
}
variable "ec2_list_config" {
  type = list(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))
  # Only t2.micro is available in this region

  validation {
    # condition = [
    #     #for config in var.ec2_list_config : config.instance_type == "t2.micro"  #Using it for one time use
    #     for config in var.ec2_list_config : contains(["t2.micro"], config.instance_type) #Extending for future
    #     ]
    condition = alltrue([
      #for config in var.ec2_list_config : config.instance_type == "t2.micro"  #Using it for one time use
      for config in var.ec2_list_config : contains(["t2.micro"], config.instance_type) #Extending for future
    ])
    error_message = "Only t2.micro allowed"
  }

  validation {
    # condition = [
    #     #for config in var.ec2_list_config : config.instance_type == "t2.micro"  #Using it for one time use
    #     for config in var.ec2_list_config : contains(["t2.micro"], config.instance_type) #Extending for future
    #     ]
    condition = alltrue([
      for ami in var.ec2_list_config : contains(["nginx", "ubuntu"], ami.ami)
    ])
    error_message = "Only ubuntu & nginx are Allowed"
  }
  default = []
}



variable "ec2_map_config" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))
  validation {
    condition = alltrue([
      #for key, config in var.ec2_map_config : contains(["t2.micro"], config.instance_type) #Extending for future
      for config in values(var.ec2_map_config) : contains(["t2.micro"], config.instance_type) #Extending for future
    ])
    error_message = "Only t2.micro allowed"
  }

  validation {

    condition = alltrue([
      # for config in values(var.ec2_map_config) : contains(["nginx", "ubuntu"], config.ami)
      for key, config in var.ec2_map_config : contains(["nginx", "ubuntu"], config.ami)

    ])
    error_message = "Only ubuntu & nginx are Allowed"
  }
  # validation {

  #   condition = alltrue([
  #      # for config in values(var.ec2_map_config) : contains(["nginx", "ubuntu"], config.ami)
  #       for key, config in var.ec2_map_config : config.subnet_index < length(aws_subnet.subnet)

  #       ])
  #   error_message = "Invalid subnet_index"
  # }
}