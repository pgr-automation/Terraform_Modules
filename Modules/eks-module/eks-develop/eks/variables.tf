variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "eks-demo-cluster"
  
}
variable "eks_subnet_ids" {
  description = "Subnet IDs for the EKS Cluster"
  type        = list(string)
  default     = []
  
}
variable "aws_iam_role_name" {
  description = "IAM Role name for EKS Cluster"
  type        = string
  default     = "AmazonEKSCluster"
  
}
variable "eks-version" {
  description = "EKS version"
  type        = string
  default     = "1.21"
  
}
variable "node_group_name" {
  description = "Node group name"
  type        = string
  default     = "eks-demo-node-group"
  
}
variable "node_max_unavailable" {
  description = "Maximum number of nodes that can be unavailable during a node update"
  type        = number
  default     = 1
  
}
variable "ng_iam_role_name" {
  description = "IAM Role name for EKS Node Group"
  type        = string
  default     = "AmazonEKSWorkerNodeRole"
  
}
variable "node_group_disk_size" {
  description = "Disk size for the EKS Node Group"
  type        = number
  default     = 10
  
}
variable "node_group_instance_types" {
  description = "Instance types for the EKS Node Group"
  type        = list(string)
  default     = []
  
}