# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
module "jenkins-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
  # insert the 10 required variables here
  name = "jenkins_server"

  
  ami = "ami-0a7d80731ae1b2435"
  
  #instance type 
  instance_type = "t2.micro"

  #key pair
  key_name = "project-1-key"

  #public subnet id to create instance their
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]

  #public SG-id attached to public subnet in vp
  vpc_security_group_ids = [module.jenkins-sg.security_group_id]

  #userdata
  user_data = file("${path.module}/install-build-tool.sh")

  #tags
  tags = {
    name = "jenkins_server"
    Terraform = "true"
    envrionment = "Dev"
  }

}
