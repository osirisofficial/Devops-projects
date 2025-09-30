module "ansible-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.1"

  name = "ansible-ec2"

  ami                    = "ami-0bbdd8c17ed981ef9"
  instance_type          = "t2.large" 
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [module.ansible_sg.security_group_id]
  associate_public_ip_address = true
  key_name = "project-5-key"
  #user_data_base64            = base64encode(local.user_data)
  
  root_block_device = {
    encrypted  = true
    type       = "gp2"
    size       = 50

  }



}
