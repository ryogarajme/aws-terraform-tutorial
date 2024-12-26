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

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type
#   root_block_device {
#     delete_on_termination = true
#     volume_size           = var.root_block_device.volume_size
#     volume_type           = var.root_block_device.volume_type
#   }

#   tags = merge(local.common_tags, var.additional_tags, {
#     Name = "Yogaraj"
#   })
# }
