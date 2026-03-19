include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/eks"
}

# This is the "Magic" - it reads the outputs you just saw in your terminal
dependency "vpc" {
  config_path = "../vpc"

  # This allows 'init' and 'plan' to run even if VPC isn't deployed yet
  mock_outputs = {
    vpc_id          = "vpc-12345678"
    private_subnets = ["subnet-12345", "subnet-67890"]
}
}

inputs = {
  cluster_name = "dev-eks-cluster"
  vpc_id       = dependency.vpc.outputs.vpc_id
  subnet_ids   = dependency.vpc.outputs.private_subnets
}
