terraform {
  required_version = "~> v1.12"

  required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "devops-aws-manas"
    key = "project-1/ec2/jenkins/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

# datasource  : to get vpc deatils from remote state
data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
      bucket = "devops-aws-manas"
      key = "project-2/vpc/terraform.tfstate"
      region = "us-east-1"
    }
}