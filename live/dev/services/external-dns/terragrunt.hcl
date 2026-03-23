include "root" {
  path = find_in_parent_folders()
}

dependency "eks" {
  config_path = "../../eks"
}

inputs = {
  oidc_provider = dependency.eks.outputs.oidc_provider
  role_name     = "external-dns-role"
  # This policy allows the pod to change Route53 records
  role_policy_arns = ["arn:aws:iam::aws:policy/AmazonRoute53FullAccess"]
  oidc_fully_qualified_subjects = ["system:serviceaccount:external-dns:external-dns"]
}