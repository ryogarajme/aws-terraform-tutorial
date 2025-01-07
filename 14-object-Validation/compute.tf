locals {
  allowed_instance_type = ["t2.micro", "t3.micro"]
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


resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.this[0].id
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = {
    CostCenter = "1234"
  }

  lifecycle {
    # precondition {
    #   condition     = contains(local.allowed_instance_type, var.instance_type)
    #   error_message = "Var Invalid instance type"
    # }
    create_before_destroy = true
    postcondition {
      condition     = contains(local.allowed_instance_type, self.instance_type)
      error_message = "self Invalid instance type"
    }
  }
}

check "cost_center_check" {
  assert {
    condition     = can(aws_instance.this.tags.CostCenter != "")
    error_message = "Your AWS Instance does not have a CostCenter tag."
  }
}