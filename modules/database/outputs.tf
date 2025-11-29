output "cluster_endpoint" {
  value       = aws_rds_cluster.this.endpoint
  description = "Aurora cluster endpoint"
}

output "reader_endpoint" {
  value       = aws_rds_cluster.this.reader_endpoint
  description = "Aurora reader endpoint"
}

output "cluster_id" {
  value       = aws_rds_cluster.this.id
  description = "Aurora cluster ID"
}

output "security_group_id" {
  value       = aws_security_group.db.id
  description = "Database security group ID"
}

output "username_parameter" {
  value       = aws_ssm_parameter.db_username.name
  description = "SSM parameter name for username"
}

output "password_parameter" {
  value       = aws_ssm_parameter.db_password.name
  description = "SSM parameter name for password"
}

output "endpoint_parameter" {
  value       = aws_ssm_parameter.db_endpoint.name
  description = "SSM parameter name for endpoint"
}

