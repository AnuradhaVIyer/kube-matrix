variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for Aurora"
}

variable "db_name" {
  type        = string
  description = "Initial database name"
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
  description = "Aurora MySQL engine version"
  default     = "8.0.mysql_aurora.3.05.0"
}

variable "serverless_v2_min_capacity" {
  type        = number
  description = "Serverless V2 minimum ACUs"
  default     = 0.5
}

variable "serverless_v2_max_capacity" {
  type        = number
  description = "Serverless V2 maximum ACUs"
  default     = 4
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days"
  default     = 7
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot on destroy"
  default     = true
}

variable "db_allowed_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to connect to database"
  default     = ["10.0.0.0/8"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}

