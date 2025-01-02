variable "subnet_count" {
  type    = number
  default = 2
}

variable "ec2_instance_count" {
  type    = number
  default = 1
}

variable "instance_type" {
  type = string
}

variable "ec2_list_config" {
  type = list(object({
    instance_type = string
    ami           = string
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
        for else in var.ec2_list_config : contains(["nginx", "ubuntu"], else.ami)
        ])
    error_message = "Only ubuntu & nginx are Allowed"
  }
}