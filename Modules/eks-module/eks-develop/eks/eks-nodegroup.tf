resource "aws_eks_node_group" "eks_cluster_demo_nodegroup_demo" {
  cluster_name    = aws_eks_cluster.eks_cluster_demo.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.AmazonEKSCluster.arn
  subnet_ids      = var.eks_subnet_ids
  disk_size = var.node_group_disk_size != 0 ? var.node_group_disk_size : null
  instance_types = var.node_group_instance_types != [] ? var.node_group_instance_types : null
    scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  update_config {
    max_unavailable  = var.node_max_unavailable != 0 ? var.node_max_unavailable : null

  }
  depends_on = [ 
    aws_eks_cluster.eks_cluster_demo,
    aws_iam_role_policy_attachment.pgr-ng-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.pgr-ng-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.pgr-ng-AmazonEKS_CNI_Policy,
    ]
  
}