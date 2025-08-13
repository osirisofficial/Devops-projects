variable "vpc_name" {
  type = string
  default = "project1"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "vpc_private_subnets_cidr" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets_cidr" {
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "vpc_database_subnets_cidr" {
  type = list(string)
  default = ["10.0.5.0/24","10.0.6.0/24"]
}
