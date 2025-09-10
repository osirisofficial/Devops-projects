module "ec2_req_1_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "for-anisble-ec2"
  description = "sg for ansible ec2 to gives ssh access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id


  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp","http-80-tcp"]

  ingress_with_cidr_blocks = [
    {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        description = "jenkins"
        cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress_rules = ["all-all"]
}