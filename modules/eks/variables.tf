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
  description = "Private subnet IDs"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs"
  default     = []
}

variable "eks_version" {
  type        = string
  description = "EKS cluster version"
  default     = "1.29"
}

variable "endpoint_public_access" {
  type        = bool
  description = "Enable public endpoint"
  default     = true
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

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}

