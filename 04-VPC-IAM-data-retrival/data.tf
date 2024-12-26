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


data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "Prod"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_policy_document" "static_website" {
  statement {
    sid = "PublicRead"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::*/*"]
  }
}

resource "aws_s3_bucket" "pub_read_bucvket" {
  bucket = "my-public-read-bucket"

}