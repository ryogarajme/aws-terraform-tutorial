terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.7.0"
    }
  }
  required_version = "~> 1.7"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      managed_by = "terraform"
      Project = "Lambda Project"
    }
  }
}