include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "eks" {
  config_path = "../../eks"


  mock_outputs = {
    oidc_provider_arn = "arn:aws:iam::123456789012:oidc-provider/dummy"
  }
}

inputs = {
  cluster_name = "dev-eks-cluster"
  # This links the Kubernetes Service Account to an AWS IAM Role
  service_account_name      = "argocd-server"
  service_account_namespace = "argocd"
  oidc_provider_arn       = dependency.eks.outputs.oidc_provider_arn
}

terraform {
  source = "../../../../modules/iam-role" 

}


