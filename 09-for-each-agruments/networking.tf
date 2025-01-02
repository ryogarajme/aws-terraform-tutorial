resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Project = local.project
    Name    = local.project
  }
}

resource "aws_subnet" "subnet" {
  for_each   = var.subnet_config
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr_block

  tags = {
    project = local.project
    Name    = "${local.project}-${each.key}"
  }
}
