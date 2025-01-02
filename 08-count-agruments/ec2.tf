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

data "aws_ami" "nginx" {

  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-nginx-1.27.*-linux-debian-12-x86_64-hvm-ebs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2_count" {
  ami           = data.aws_ami.ubuntu.id
  count         = var.ec2_instance_count
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet[count.index % length(aws_subnet.subnet)].id
  tags = {
    Name = "${local.project}-${count.index + 1}"
  }

}

resource "aws_instance" "ec2_list" {
  ami           = local.ami_ids[var.ec2_list_config[count.index].ami]
  count         = length(var.ec2_list_config)
  instance_type = var.ec2_list_config[count.index].instance_type
  subnet_id     = aws_subnet.subnet[count.index % length(aws_subnet.subnet)].id
  tags = {
    Name = "${local.project}-${count.index + 1}"
  }

}

