module "iam_role_arn_argocd" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "~> 5.0"

  create_role      = true
  role_name        = "argocd-server-role"
  provider_url     = var.oidc_provider # From EKS output
  role_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"] # Add specific policies as needed

  oidc_fully_qualified_subjects = ["system:serviceaccount:argocd:argocd-server"]
}

output "role_arn" {
  description = "The ARN of the created IAM role"
  value       = module.iam_role_arn_argocd.iam_role_arn
}