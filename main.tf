module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "iam" {
  source       = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  subnet_ids         = module.vpc.subnet_ids
  vpc_id             = module.vpc.vpc_id
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn      = module.iam.eks_node_role_arn
  desired_capacity   = var.desired_capacity
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  instance_type      = var.instance_type
}
