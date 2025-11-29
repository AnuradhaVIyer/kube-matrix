project                         = "km"
environment                     = "dev"
region                          = "us-east-1"
region_short                    = "use1"
az_count                        = "2"
az1                             = "use1b"
az2                             = "use1a"

# VPC settings
component                       = "vpc"
vpc_cidr                        = "10.10.0.0/16"
public_subnet_cidrs             = ["10.10.1.0/24","10.10.2.0/24"]
private_subnet_cidrs            = ["10.10.101.0/24","10.10.102.0/24"]

# EC2 
instance_type                   = "t3.large"
ssh_public_key                  = "~/.ssh/id_rsa.pub"
ec2_admin_username              = "ec2-user"
admin_password                  = "DevSecurePassword123!"

# Database (Aurora MySQL)
# db_master_username              = "mysqladmin"
# db_master_password              = "DevSecureDBPassword123!"
# db_master_password_ssm_key      = "/km/dev/db/master_password"
# db_name                         = "km_dev"

# ===== DATABASE =====
db_name                    = "kubedb"
db_master_username         = "kmadmin"
db_master_password         = "KMAdminSecureDB2024!"
aurora_engine_version      = "8.0.mysql_aurora.3.08.2"
serverless_v2_min_capacity = 0.5
serverless_v2_max_capacity = 4
backup_retention_days      = 7

# ===== EKS =====
eks_version       = "1.29"
node_desired_size = 2
node_min_size     = 1
node_max_size     = 5
node_instance_type = "t3.medium"




