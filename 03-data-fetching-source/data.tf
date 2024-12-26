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
  # filter {
  #     name = "region"
  #     values = ["us-east-2"]
  # }

}

output "ubuntu" {
  value = data.aws_ami.ubuntu.id
}

#Region Filter

# data "aws_ami" "ubuntu" {
#     provider = aws.frankfurt
#     most_recent = true
#     owners = ["099720109477"]

#     filter {
#         name   = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
#     }

#     filter {
#         name = "virtualization-type"
#         values = ["hvm"]
#     }
#     # filter {
#     #     name = "region"
#     #     values = ["us-east-2"]
#     # }

# }

# output "ubuntu" {
#   value = data.aws_ami.ubuntu.id
# }

data "aws_caller_identity" "current" {}

data "aws_region" "current" {} 

output "account_id" {
  value = data.aws_caller_identity.current.*
}

output "region" {
  value = data.aws_region.current.*
}