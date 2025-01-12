##################
#VPC & SUBNET Config
##################

data "aws_vpc" "vpc" {
  default = true
}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "custom"
  }
}

moved {
  from = aws_subnet.allowed
  to   = aws_subnet.private1
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name   = "custom_vpc_subnet-pvt-1"
    Access = "Private"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.custom.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name   = "custom_vpc_subnet-pvt-2"
    Access = "Private"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.custom.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "custom_vpc_subnet-public-1"
  }
}


resource "aws_subnet" "notallowed" {
  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = "172.31.128.0/24"
  tags = {
    Name = "default_Vpc_subnet"
  }
}


##################
#SG  config
##################

resource "aws_security_group" "source" {
  vpc_id      = aws_vpc.custom.id
  name        = "sg_source"
  description = "SG for RDS"

}
resource "aws_security_group" "complaint" {
  vpc_id      = aws_vpc.custom.id
  name        = "complaint_source"
  description = "complaint SG for RDS"
}

resource "aws_vpc_security_group_ingress_rule" "db-ingress" {
  security_group_id            = aws_security_group.complaint.id
  referenced_security_group_id = aws_security_group.source.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.non-complaint.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_security_group" "non-complaint" {
  vpc_id      = aws_vpc.custom.id
  name        = "non_complaint_source"
  description = "non_complaint SG for RDS"

}