resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Project = local.project
    Name    = local.project
  }
}

resource "aws_subnet" "subnet" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    project = local.project
    Name    = "${local.project}-${count.index}"
  }
}
