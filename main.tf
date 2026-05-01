module "vpc" {
  source                = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
}

module "security_groups" {
  source = "./modules/security_groups"
  project_name          = var.project_name
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}