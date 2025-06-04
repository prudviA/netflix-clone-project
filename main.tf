module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source            = "./modules/eks"
  cluster_name      = var.cluster_name
  subnet_ids        = module.vpc.public_subnet_ids
  cluster_role_arn  = module.iam.cluster_role_arn
  node_role_arn     = module.iam.node_role_arn
}
