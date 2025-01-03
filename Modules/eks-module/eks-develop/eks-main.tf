module "eks" {
  source = "./eks"
  cluster_name = var.cluster_name
  eks_subnet_ids = var.eks_subnet_ids
  aws_iam_role_name = var.aws_iam_role_name
  eks-version = var.eks-version
  node_group_name = var.node_group_name
  node_max_unavailable = var.node_max_unavailable
  ng_iam_role_name = var.ng_iam_role_name
  node_group_disk_size = var.node_group_disk_size
  node_group_instance_types = var.node_group_instance_types
  
  
}