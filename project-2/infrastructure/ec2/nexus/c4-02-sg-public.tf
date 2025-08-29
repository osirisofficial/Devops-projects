module "nexus_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp", "https-443-tcp", "http-80-tcp"]

  ingress_with_cidr_blocks = [
     {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      description = "nexus"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = ["all-all"]
}