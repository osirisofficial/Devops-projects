
module "eks" {
  depends_on = [ aws_security_group.eks_public_access_sg ]
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.29"

  cluster_endpoint_public_access  = true

  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids               = data.terraform_remote_state.vpc.outputs.private_subnets # private subnet id in which we are going to create it


  eks_managed_node_groups = {
    nodes = {
      min_size     = 1
      max_size     = 2
      desired_size = 2

      instance_types = ["t2.small"]
      capacity_type  = "SPOT"
      
      tags = {
        Name = "eks-nodes"
      }
    }
  }

  cluster_additional_security_group_ids = [aws_security_group.eks_public_access_sg.id]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}