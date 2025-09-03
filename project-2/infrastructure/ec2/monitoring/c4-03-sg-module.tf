module "monitoring_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "for-monitoring"
  description = "monitoring"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp", "https-443-tcp", "http-80-tcp"]

  ingress_with_cidr_blocks = [
     {
      from_port   = 9115
      to_port     = 9115
      protocol    = "tcp"
      description = "blackbox exporter"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9090
      to_port     = 9090
      protocol    = "tcp"
      description = "prometheus"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      description = "blackbox exporter"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  
  egress_rules = ["all-all"]
}