data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_instance" "this" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  tags = {
    name = "terraform-cloud"
  }
}
