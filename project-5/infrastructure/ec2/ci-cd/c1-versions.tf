terraform {
  required_version = "~>v1.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "manas-devops-projects"
    key = "project-5/ec2/ci-cd/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "manas-devops-projects"
      key = "project-5/vpc/terraform.tfstate"
      region = "us-east-1"
    }
}

