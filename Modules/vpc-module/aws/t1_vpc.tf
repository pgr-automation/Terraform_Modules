resource "aws_vpc" "main" {
  # Specify the IPv4 CIDR block (optional: use IPAM if ipv4_ipam_pool_id is provided)
  cidr_block                = var.cidr_block
  instance_tenancy          = var.instance_tenancy == "default" ? "default" : "dedicated"
  enable_dns_support        = var.enable_dns_support ? true : false
  enable_dns_hostnames      = var.enable_dns_hostnames ? true : false
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block ? true : false

  # IPAM Configuration (Optional)
  ipv4_ipam_pool_id         = var.ipv4_ipam_pool_id != null ? var.ipv4_ipam_pool_id : null
  ipv4_netmask_length       = var.ipv4_netmask_length != null ? var.ipv4_netmask_length : null
  ipv6_ipam_pool_id         = var.ipv6_ipam_pool_id != null ? var.ipv6_ipam_pool_id : null
  ipv6_netmask_length       = var.ipv6_netmask_length != null ? var.ipv6_netmask_length : null
  ipv6_cidr_block           = var.ipv6_cidr_block != null ? var.ipv6_cidr_block : null
  ipv6_cidr_block_network_border_group = var.ipv6_cidr_block_network_border_group != null ? var.ipv6_cidr_block_network_border_group : null

  # Enable Network Address Usage Metrics (Optional)
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
#
  # Tags
  tags = {
    Name = var.vpc_name
  }
}