output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  value       = module.network.public_subnet_cidrs
}

output "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  value       = module.network.private_subnet_cidrs
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.network.nat_gateway_ids
}

output "security_group_ids" {
  description = "Security groups created by the network module"
  value       = module.network.security_group_ids
}

output "region" {
  description = "Explicitly show region for downstream modules"
  value       = var.region
}

output "ecr_frontend_repository_url" {
  value = module.ecr_frontend.ecr_repository_url
}

output "ecr_frontend_policy_arn" {
  value = module.ecr_frontend.ecr_policy_arn
}

output "ecr_backend_repository_url" {
  value = module.ecr_backend.ecr_repository_url
}

output "ecr_backend_policy_arn" {
  value = module.ecr_backend.ecr_policy_arn
}

output "ecr_database_repository_url" {
  value = module.ecr_database.ecr_repository_url
}

output "ecr_database_policy_arn" {
  value = module.ecr_database.ecr_policy_arn
}


# ===== DATABASE OUTPUTS =====
output "db_endpoint" {
  value       = module.database.cluster_endpoint
  description = "Aurora database endpoint"
}

output "db_reader_endpoint" {
  value       = module.database.reader_endpoint
  description = "Aurora reader endpoint"
}

output "db_sg_id" {
  value       = module.database.security_group_id
  description = "Database security group ID"
}

output "db_username_param" {
  value       = module.database.username_parameter
  description = "SSM parameter for DB username"
}

output "db_password_param" {
  value       = module.database.password_parameter
  description = "SSM parameter for DB password"
}

# ===== EKS OUTPUTS =====
output "eks_cluster_name" {
  value       = module.eks.cluster_name
  description = "EKS cluster name"
}

output "eks_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "EKS cluster endpoint"
}

output "eks_ca" {
  value       = module.eks.cluster_ca
  sensitive   = true
  description = "EKS CA certificate"
}

output "kubeconfig_command" {
  value       = module.eks.kubeconfig_command
  description = "Command to update kubeconfig"
}

