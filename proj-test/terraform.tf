terraform {
  cloud {

    organization = "YSacademy"

    workspaces {
      name = "terraform-cli-driven-2"
    }
  }
  required_version = "~> 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}