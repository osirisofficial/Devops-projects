terraform {
  required_version = "~> v1.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  #backend block
  backend "s3" {
    bucket = "devops-aws-manas"
    key = "project-1/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
    profile = "default"
  region = "us-east-1"
}