variable "oidc_provider" {
  description = "The OpenID Connect identity provider URL from the EKS cluster"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role to create"
  type        = string
  default     = "argocd-server-role"
}