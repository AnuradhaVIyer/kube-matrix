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
