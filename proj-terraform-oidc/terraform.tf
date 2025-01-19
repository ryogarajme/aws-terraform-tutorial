terraform {
  cloud {

    organization = "YSacademy"

    workspaces {
      name = "cli-default"
    }
  }
  required_version = "~> 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}