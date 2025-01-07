data "aws_vpc" "default" {
  default = true
}
data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "this" {
  count             = 2
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.${128 + count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[
    count.index % length(data.aws_availability_zones.available.names)
  ]
  lifecycle {

    postcondition {
      condition     = contains(data.aws_availability_zones.available.names, self.availability_zone)
      error_message = "invalid AZ"
    }
  }
}

check "high_availability_check" {
  assert {
    condition     = length(toset([for sub in aws_subnet.this : sub.availability_zone])) > 1
    error_message = "You are deployed all subnets in same AZ please distribute them across regions"
  }

}