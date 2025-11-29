variable "project" { default = "km" }
variable "component" { default = "vpc" }
variable "environment" { default = "dev" }
variable "region" { default = "us-east-1" }
variable "vpc_cidr" { default = "10.10.0.0/16" }
variable "az_count" { default = 2 }
variable "public_subnet_cidrs" { default = ["10.10.1.0/24","10.10.2.0/24"] }
variable "private_subnet_cidrs" { default = ["10.10.101.0/24","10.10.102.0/24"] }
variable "enable_nat_per_az" { default = false }
variable "access_cidr" { default = "34.229.141.205/32" } # replace with corporate/dev IP
variable "tags" { default = { Owner = "platform-team", CostCenter="CC-12345" } }


# ===== DATABASE VARIABLES =====
variable "db_name" {
  type        = string
  description = "Database name"
  default     = "kubedb"
}

variable "db_master_username" {
  type        = string
  description = "Database master username"
  sensitive   = true
}

variable "db_master_password" {
  type        = string
  description = "Database master password"
  sensitive   = true
}

variable "aurora_engine_version" {
  type        = string
  description = "Aurora engine version"
  default     = "8.0.mysql_aurora.3.05.0"
}

variable "serverless_v2_min_capacity" {
  type        = number
  description = "Serverless V2 minimum capacity"
  default     = 0.5
}

variable "serverless_v2_max_capacity" {
  type        = number
  description = "Serverless V2 maximum capacity"
  default     = 4
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days"
  default     = 7
}

# ===== EKS VARIABLES =====
variable "eks_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.29"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of nodes"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of nodes"
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of nodes"
}

variable "node_instance_type" {
  type        = string
  description = "Node instance type"
  default     = "t3.medium"
}

