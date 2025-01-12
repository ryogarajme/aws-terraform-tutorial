##################
#subnet Validation
##################
data "aws_vpc" "default" {
  default = true
}


data "aws_subnet" "input_subnet" {
  for_each = toset(var.subnet_ids)
  id       = each.value

  lifecycle {
    postcondition {
      condition     = self.vpc_id != data.aws_vpc.default.id
      error_message = <<-EOT
        "${self.id}" is not a valid subnet id. Its part of the Default VPC 
        Please do not deploy rds in default vpc.
      EOT
    }

    postcondition {
      condition     = can(lower(self.tags.Access) == "private")
      error_message = <<-EOT
        The Following Subnet is not marked Private
       "${self.id}" 
        Please ensure the private tags has been added.
      EOT
    }
  }
}

##################
#SG  Validation
##################

data "aws_vpc_security_group_rules" "input_rule" {
  filter {
    name   = "group-id"
    values = var.security_group_ids
  }
}

data "aws_vpc_security_group_rule" "input_rules" {
  for_each               = toset(data.aws_vpc_security_group_rules.input_rule.ids)
  security_group_rule_id = each.value

  lifecycle {
    postcondition {
      condition = (
        self.is_egress
        ? true
        : self.cidr_ipv4 == null
        && self.cidr_ipv6 == null
        && self.referenced_security_group_id != null
      )
      error_message = <<-EOT
        Following security group containing an invalid inboud rule
        ID = ${self.security_group_id}
        Condition to met
        1. rules do not allow traffic from IP CIDR Block. Allowed from Security group id
        
      EOT
    }
  }
}