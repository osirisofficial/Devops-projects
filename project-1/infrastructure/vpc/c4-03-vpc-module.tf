module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets_cidr
  public_subnets  = var.vpc_public_subnets_cidr

  #database subnet
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = var.vpc_database_subnets_cidr

  #nat gateway
  single_nat_gateway = true
  enable_nat_gateway = true

#vpc dns parameter  : it shouled be assigned beacuse in public subnets ec2 instance we need public ip
  enable_dns_hostnames = true
  enable_dns_support = true


   tags = {
    Name        = "project1"
    Terraform   = "true"
    Environment = "dev"
  }
}