resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version = 

  vpc_config {
    subnet_ids = ""
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]
}

#resource "aws_iam_openid_connect_provider" "oidc" {
#  client_id_list  = ["sts.amazonaws.com"]
#  thumbprint_list = ["9e99a48a9960b14926bb7f3b30fc1b5aad50c6aa"]
#  url             = aws_eks_cluster.eks.identity[0].oidc[0].issuer
#}
