locals {
  ec2_names = ["instance-1", "instance-2"]
}

data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "new_final" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

}

module "compute" {
  source = "./modules/compute"
  ami_id = data.aws_ami.ubuntu.id
}

moved {
  from = aws_instance.new_list["instance-1"]
  to   = aws_instance.new_final
}

moved {
  from = aws_instance.new_list["instance-2"]
  to   = module.compute.aws_instance.this
}

moved {
  from = aws_instance.new_list[0]
  to   = aws_instance.new_list["instance-1"]
}

moved {
  from = aws_instance.new_list[1]
  to   = aws_instance.new_list["instance-2"]
}