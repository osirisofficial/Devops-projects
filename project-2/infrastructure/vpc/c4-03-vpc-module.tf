module "vpc" {
   source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = var.name
  cidr = var.cidr_block

  azs                 = var.azs

  //public subnet
  public_subnets      = var.public_subnet_cidr
  public_subnet_names = var.public_subnet_names
  map_public_ip_on_launch = true # its when any ec2 will be created in public it will get public ip
  
  //private subnet
  private_subnets     = var.private_subnet_cidr
  private_subnet_names = var.private_subnet_names

 
  
  #database subnet
  database_subnets    = var.database_subnet_cidr
  database_subnet_names    = var.database_subnet_names
  create_database_subnet_group  = true
  create_database_subnet_route_table = true

  
  //hostname & it support
  enable_dns_hostnames = true
  enable_dns_support   = true

  //natgate way
  enable_nat_gateway = true
  single_nat_gateway = true


  enable_vpn_gateway = true


  tags = {
    name = "project-2-vpc"
    terraform = "yes"
  }
}