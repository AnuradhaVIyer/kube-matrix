project                         = "km"
environment                     = "dev"
region                          = "us-east-1"
region_short                    = "use1"
az_count                        = "2"
az1                             = "use1b"
az2                             = "use1a"

# VPC settings
component                       = "vpc"
vpc_cidr                        = "10.0.0.0/16"
public_subnet_cidrs             = ["10.10.1.0/24","10.10.2.0/24"]
private_subnet_cidrs            = ["10.10.101.0/24","10.10.102.0/24"]

# EC2 
instance_type                   = "t3.large"
ssh_public_key                  = "~/.ssh/id_rsa.pub"
ec2_admin_username              = "ec2-user"
admin_password                  = "DevSecurePassword123!"

# Database (Aurora MySQL)
db_master_username              = "mysqladmin"
db_master_password              = "DevSecureDBPassword123!"
db_master_password_ssm_key      = "/km/dev/db/master_password"
db_name                         = "km_dev"







