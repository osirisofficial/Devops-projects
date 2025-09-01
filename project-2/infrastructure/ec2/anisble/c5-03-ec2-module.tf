
module "ansible-ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
  # insert the 10 required variables here
  name = "ansible_server"

  
  ami = "ami-0a7d80731ae1b2435"
  
  #instance type 
  instance_type = "t2.micro"

  #key pair
  key_name = "project-2-key"

  #public subnet id to create instance their
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]

  #public SG-id attached to public subnet in vp
  vpc_security_group_ids = [module.ansible_sg.security_group_id]

  #assign public ip to instance
  associate_public_ip_address = true

  #userdata
 #user_data_base64 = base64encode(file("${path.module}/install-build-tool.sh"))

  #tags
  tags = {
    name = "ansible_server"
    Terraform = "true"
    envrionment = "Dev"
  }

}
