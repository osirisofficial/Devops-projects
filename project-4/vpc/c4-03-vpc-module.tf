module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "project-4-vpc"
  cidr = "10.0.0.0/16"

  //AZs
  azs                 = ["us-east-1a","us-east-1b"]

  //public subnet
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_names = ["Public_Subnet_One", "Public_Subnet_Two"]
  map_public_ip_on_launch = true # its when any ec2 will be created in public it will get public ip

  //private subnet
  private_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
  private_subnet_names = ["Private_Subnet_One", "Private_Subnet_Two"]

  //database subnet
  database_subnets    = ["10.0.5.0/24","10.0.6.0/24"]
  database_subnet_names    = ["DB_Subnet_One", "DB_Subnet_Two"]
  create_database_subnet_group  = true
  create_database_subnet_route_table = true
  
  
  //hostname support
  enable_dns_hostnames = true
  enable_dns_support   = true

  //nat gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  

  enable_vpn_gateway = true

  tags = {
    vpc = "project-4-vpc"
    terraform = true
  }
  
}
