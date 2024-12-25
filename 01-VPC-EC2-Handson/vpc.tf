resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.common_tags, {
    Name = "tf-vpc"
  })
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  tags = merge(local.common_tags, {
    Name = "tf-pubsubnet"
  })
}
resource "aws_subnet" "pvt_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = merge(local.common_tags, {
    Name = "tf-pvtsubnet"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(local.common_tags, {
    Name = "tf-igw"
  })
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.common_tags, {
    Name = "tf-pubrt"
  })
}

resource "aws_route_table_association" "rt-assocaition" {
  route_table_id = aws_route_table.pub_rt.id
  subnet_id      = aws_subnet.pub_subnet.id
}