
module "ec2-req-1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
  # insert the 10 required variables here
  name = "ec2-req-1"

  
  ami = "ami-0a7d80731ae1b2435"
  
  #instance type 
  instance_type = "t2.medium"

  #key pair
  key_name = "project-4-key"

  #public subnet id to create instance their
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets[0]

  #public SG-id attached to public subnet in vp
  vpc_security_group_ids = [module.ec2_req_1_sg.security_group_id]

  #assign public ip to instance
  associate_public_ip_address = true

  #storage
  root_block_device = {
    encrypted  = true
    type       = "gp2"
    size       = 16
  }

  #userdata
  user_data_base64 = base64encode(file("${path.module}/anisblenode_setup.sh"))

  #tags
  tags = {
    name = "ec2-req-1"
    Terraform = "true"
    envrionment = "Dev"
  }

}
