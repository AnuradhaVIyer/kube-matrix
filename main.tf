module "network" {
  source      = "./modules/network"
  project     = var.project
  component   = var.component
  environment = var.environment
  region      = var.region
  vpc_cidr    = var.vpc_cidr
  az_count    = var.az_count
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_per_az    = var.enable_nat_per_az
  access_cidr      = var.access_cidr
  tags                 = var.tags
}



# FRONTEND ECR REPOSITORY
module "ecr_frontend" {
  source = "./modules/ecr"
  name   = "frontend-repo"
}

# BACKEND ECR REPOSITORY
module "ecr_backend" {
  source = "./modules/ecr"
  name   = "backend-repo"
}

# DATABASE ECR REPOSITORY
module "ecr_database" {
  source = "./modules/ecr"
  name   = "database-repo"
}
##


module "database" {
  source = "./modules/database"

  project                = var.project
  environment            = var.environment
  vpc_id                 = module.network.vpc_id
  private_subnet_ids     = module.network.private_subnet_ids
  db_name                = var.db_name
  db_master_username     = var.db_master_username
  db_master_password     = var.db_master_password
  aurora_engine_version  = var.aurora_engine_version
  serverless_v2_min_capacity = var.serverless_v2_min_capacity
  serverless_v2_max_capacity = var.serverless_v2_max_capacity
  backup_retention_days  = var.backup_retention_days
  skip_final_snapshot    = var.environment == "dev" ? true : false
  db_allowed_cidr_blocks = [var.vpc_cidr]

  tags = {
    Environment = var.environment
    Project     = var.project
    Component   = "database"
    ManagedBy   = "terraform"
  }
}

module "eks" {
  source = "./modules/eks"

  project              = var.project
  environment          = var.environment
  vpc_id               = module.network.vpc_id
  private_subnet_ids   = module.network.private_subnet_ids
  public_subnet_ids    = module.network.public_subnet_ids
  eks_version          = var.eks_version
  endpoint_public_access = var.environment == "dev" ? true : false
  node_desired_size    = var.node_desired_size
  node_min_size        = var.node_min_size
  node_max_size        = var.node_max_size
  node_instance_type   = var.node_instance_type

  tags = {
    Environment = var.environment
    Project     = var.project
    Component   = "eks"
    ManagedBy   = "terraform"
  }

  depends_on = [module.network]
}

