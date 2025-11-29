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
