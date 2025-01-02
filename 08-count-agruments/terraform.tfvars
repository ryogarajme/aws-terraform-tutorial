subnet_count       = 3
instance_type      = "t2.micro"
ec2_instance_count = 0
ec2_list_config = [
  {
    instance_type = "t2.micro"
    ami           = "ubuntu"
  },
  {
    instance_type = "t2.micro"
    ami           = "nginx"
  }
]