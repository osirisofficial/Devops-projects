variable "name" {
    type = string
    default = "project-2-vpc"
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidr" {
  type = list(string)
  default =  ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_names" {
  type = list(string)
  default = ["public-subnet-1","public-subnet-2"]
}

variable "private_subnet_cidr" {
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_subnet_names" {
  type = list(string)
  default = ["Private-Subnet-1", "Private-Subnet-2"]
}

variable "database_subnet_cidr" {
  type = list(string)
  default = ["10.0.5.0/24"]
}

variable "database_subnet_names" {
  type = list(string)
  default = ["db-subnet-1"]
}