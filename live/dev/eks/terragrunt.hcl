dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "tfr:///terraform-aws-modules/eks/aws?version=19.15.0"
}

inputs = {
  cluster_name    = "dev-cluster"
  vpc_id          = dependency.vpc.outputs.vpc_id
  subnet_ids      = dependency.vpc.outputs.private_subnets
  # Define a simple node group
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      min_size = 1
      max_size = 2
    }
  }
}