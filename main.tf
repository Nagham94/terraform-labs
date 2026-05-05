module "vpc" {
  source                = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  private_subnet_cidr2  = var.private_subnet_cidr2
}

module "security_groups" {
  source = "./modules/security_groups"
  project_name          = var.project_name
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source               = "./modules/ec2"
  project_name         = var.project_name
  instance_type        = var.instance_type
  public_subnet_id     = module.vpc.public_subnet_id
  private_subnet_id    = module.vpc.private_subnet_id
  allow_ssh_sg_id      = module.security_groups.allow_ssh_sg_id
  allow_ssh_3000_sg_id = module.security_groups.allow_ssh_3000_sg_id
}

module "rds" {
  source               = "./modules/rds"
  project_name         = var.project_name
  env                  = var.env
  private_subnet_id    = module.vpc.private_subnet_id
  private_subnet_id2   = module.vpc.private_subnet_id2
  vpc_id               = module.vpc.vpc_id
}