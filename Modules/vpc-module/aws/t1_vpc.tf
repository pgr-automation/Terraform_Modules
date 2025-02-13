## Create VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = var.enable_dns_hostnames ? true : false
    enable_dns_support = var.enable_dns_support ? true : false
}