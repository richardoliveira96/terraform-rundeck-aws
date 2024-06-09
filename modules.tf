module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "ec2" {
  source       = "./modules/ec2"
  project_name = var.project_name
  tags         = local.tags
  vpc_id       = module.eks_network.vpc
  subnet_id    = module.eks_network.subnet_pub_1a
}