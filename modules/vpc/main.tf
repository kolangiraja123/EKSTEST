module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags

  enable_nat_gateway = true
  single_nat_gateway = true # Saves cost for learning

}