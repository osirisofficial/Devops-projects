module "ansible_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "for-anisble-ec2"
  description = "sg for ansible ec2 to gives ssh access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id


  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp"]
  
  egress_rules = ["all-all"]
}