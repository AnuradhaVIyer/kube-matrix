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
