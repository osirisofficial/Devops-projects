module "ci_cd_sg" {
   source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "ci-cd-sg"
  description = "Security group for ci-cd ec2"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [{
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      description      = "jenkins"
      cidr_blocks = "0.0.0.0/0"
    },{
      from_port        = 9000
      to_port          = 9000
      protocol         = "tcp"
      description      = "sonarqube"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port        = 8081
      to_port          = 8081
      protocol         = "tcp"
      description      = "nexus repo"
      cidr_blocks = "0.0.0.0/0"
    },
    ]

  egress_rules = ["all-all"]
}