variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zones" {
  description = "List of availability zones to use for subnet creation"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
    description = "CIDR for VPC"
    type = string
    default = "10.0.0.0/16"
  
}
variable "internet_gateway_name" {
  description = "Name for the Internet Gateway"
  type        = string
  default     = "main-igw"
}

variable "public_subnet_cidrs" {
    description = "List of CIDR blocks for public subnets"
    type = list(string)
    default = [ "10.0.1.0/24","10.0.2.0/24" ]

  
}

variable "public_subnet_name_prefix" {
  description = "Prefix for naming the public subnets"
  type        = string
  default     = "public-subnet"
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_subnet_name_prefix" {
  description = "Prefix for naming the private subnets"
  type        = string
  default     = "private-subnet"
}

variable "nat_elastic_ip_name" {
    description = "Nat elastic IP name"
    type = string
    default = "nat_eip"
  
}

variable "public_route_table_name" {
    description = "Routetable name for public"
    type = string
    default = "pub-rt"
}

variable "private_route_table_name" {
    description = "Routetable name for public"
    type = string
    default = "private-rt"
}

variable "aws_nat_gateway_name" {
  description = "Nat name"
  type = string
  default = "nat-gw"
  
}
variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = ""
  
}
variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = ""
  
}