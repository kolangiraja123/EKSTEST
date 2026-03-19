output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
}

output "region" {
  description = "The AWS region where the cluster is deployed"
  value       = "us-east-1" # Or pull this from your provider if dynamic
}

# Add this to your existing outputs.tf
output "oidc_provider_arn" {
  description = "The ARN of the OIDC Provider if enable_irsa = true"
  value       = module.eks.oidc_provider_arn
}

output "oidc_provider" {
  description = "The OpenID Connect identity provider (issuer URL without protocol)"
  value       = module.eks.oidc_provider
}