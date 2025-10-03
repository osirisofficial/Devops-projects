module "ansible_sg" {
   source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "ansible-sg"
  description = "Security group for ansible"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  egress_rules = ["all-all"]
}