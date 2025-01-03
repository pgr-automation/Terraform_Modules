resource "aws_eks_cluster" "eks_cluster_demo" {
  name = var.cluster_name != "" ? true : false
  role_arn = aws_iam_role.AmazonEKSCluster.arn
  version = var.eks-version
  
  vpc_config {
    
    subnet_ids = var.eks_subnet_ids

  }
  tags = {
    Name = var.cluster_name
  }
  depends_on = [ 
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy
   ]
}