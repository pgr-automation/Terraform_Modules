
# Variables
variable "cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  default     = "" # Change to your preferred CIDR block
}

variable "instance_tenancy" {
  description = "Tenancy option for instances launched into the VPC. Allowed values are 'default' or 'dedicated'."
  default     = "default"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Request an Amazon-provided IPv6 CIDR block for the VPC."
  default     = false
}

variable "ipv4_ipam_pool_id" {
  description = "The ID of an IPv4 IPAM pool to allocate CIDR from."
  default     = null
}

variable "ipv4_netmask_length" {
  description = "The netmask length of the IPv4 CIDR to allocate."
  default     = null
}

variable "ipv6_ipam_pool_id" {
  description = "The ID of an IPv6 IPAM pool to allocate CIDR from."
  default     = null
}

variable "ipv6_netmask_length" {
  description = "The netmask length of the IPv6 CIDR to allocate."
  default     = null
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the VPC."
  default     = null
}

variable "ipv6_cidr_block_network_border_group" {
  description = "The network border group for the IPv6 CIDR block."
  default     = null
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics for the VPC."
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the VPC."
  default     = {}
}

variable "vpc_name" {
  description = "The name of the VPC."
  default     = "MyVPC"
}
