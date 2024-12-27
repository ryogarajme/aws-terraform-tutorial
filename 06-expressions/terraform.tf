terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
  required_version = "~> 1.0"
  backend "s3" {
    bucket         = "b5a8a4e2263e5cb7-ynrbucket2025"
    key            = "local/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-ynr-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}