terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1" # Set your preferred AWS region
}

# Call the EKS Module
module "eks_cluster" {
  source              = "./eks" # Path to the module directory
  region              = "us-east-1"
  cluster_name        = "eks-demo-cluster"
  node_group_name     = "eks-demo-node-group"
  ssh_key_name        = "kube-demo" # Replace with your SSH key pair name

  # VPC Configuration
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  # Node Group Configuration
  node_instance_type = "t3.medium"
  desired_size       = 2
  max_size           = 4
  min_size           = 2
  node_volume_size   = 20
}

output "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  value       = module.eks_cluster.cluster_name
}

output "eks_node_group_name" {
  description = "Name of the EKS Node Group"
  value       = module.eks_cluster.node_group_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS Cluster"
  value       = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_oidc_issuer" {
  description = "OIDC Issuer URL for the EKS Cluster"
  value       = module.eks_cluster.oidc_issuer
}
