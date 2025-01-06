# AWS Networking Module

A reusable Terraform module for creating and managing AWS networking infrastructure.

## Features

This module creates and manages the following AWS resources:
- Virtual Private Cloud (VPC)
- Public and Private Subnets
- Internet Gateway
- NAT Gateway (optional)
- Route Tables
- Route Table Associations
- Network ACLs (optional)

## Usage

```hcl
module "vpc" {
  source = "./modules/networking"

  vpc_config = {
    name       = "production-vpc"
    cidr_block = "10.0.0.0/16"
    tags = {
      Environment = "Production"
      Project     = "MyApp"
    }
  }

  subnet_config = {
    "public-1" = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
      tags = {
        Type = "Public"
      }
    },
    "private-1" = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
      public     = false
      tags = {
        Type = "Private"
      }
    }
  }
}

Outputs
Name	Description
vpc_id	The ID of the VPC
public_subnet_ids	List of public subnet IDs
private_subnet_ids	List of private subnet IDs
vpc_cidr_block	The CIDR block of the VPC
igw_id	The ID of the Internet Gateway
Resource Naming Convention
Resources are named using the following convention:

VPC: ${var.vpc_config.name}

Subnets: ${var.vpc_config.name}-${subnet_key}

Internet Gateway: ${var.vpc_config.name}-igw

Route Tables: ${var.vpc_config.name}-${public/private}-rt

Tagging Strategy
All resources support tagging. Default tags are merged with user-provided tags:

tags = merge(
  var.vpc_config.tags,
  {
    "Terraform"   = "true"
    "Module"      = "networking"
    "Environment" = var.vpc_config.name
  }
)
Network Architecture: 
Public subnets have direct internet access through an Internet Gateway
Private subnets can access the internet through NAT Gateway (if enabled)
Each subnet is created in a specified Availability Zone
Route tables are configured automatically based on subnet type

Limitations:
IPv6 is not currently supported
VPC endpoints are not included in this module
VPC peering must be configured separately
Transit Gateway attachments are not included

Contributing
When contributing to this module:
Update documentation for any new features
Follow existing naming conventions
Include appropriate tags for new resources
Test thoroughly before submitting changes


License
This module is released under the MIT License.

This README provides detailed information about the networking module's capabilities, configuration options, and best practices. It helps users understand:

- How to use the module
- What resources it creates
- Required and optional configurations
- Naming conventions and tagging strategy
- Security considerations
- Common troubleshooting scenarios

You can customize this further based on your specific implementation details and requirements.
