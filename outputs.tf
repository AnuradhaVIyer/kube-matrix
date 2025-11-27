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
