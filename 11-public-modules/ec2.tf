locals {
  instance_type = "t2.micro"
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

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  name = local.project_name
  ami = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.public_subnets[0]

  tags = local.common_tags
} 
