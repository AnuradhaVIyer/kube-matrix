output "cluster_name" {
  value       = aws_eks_cluster.this.name
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.this.endpoint
  description = "EKS cluster endpoint"
}

output "cluster_ca" {
  value       = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  sensitive   = true
  description = "EKS cluster CA certificate"
}

output "cluster_iam_role_arn" {
  value       = aws_iam_role.cluster.arn
  description = "EKS cluster IAM role ARN"
}

output "node_security_group_id" {
  value       = aws_security_group.cluster.id
  description = "Node security group ID"
}

output "oidc_provider_arn" {
  value       = aws_iam_openid_connect_provider.this.arn
  description = "OIDC provider ARN"
}

output "kubeconfig_command" {
  value       = "aws eks update-kubeconfig --name ${aws_eks_cluster.this.name} --region ${data.aws_caller_identity.current.account_id}"
  description = "Command to update kubeconfig"
}

