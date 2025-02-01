provider "aws" {
    region = "us-east-1"
  
}

module "vpc" {
  source                     = "github.com/pgr-automation/Terraform_Modules/Modules/vpc-module/aws"
  vpc_cidr                   = "12.0.0.0/16"
  public_subnet_cidrs        = ["12.0.1.0/24"]
  private_subnet_cidrs       = ["12.0.3.0/24", "12.0.4.0/24"]
  region                     = "us-east-1"
  public_subnet_name_prefix  = "pgr-public-subnet"   # Custom name prefix
  private_subnet_name_prefix = "pgr-private-subnet"
  availability_zones         = ["us-east-1a", "us-east-1b"]  # Specific availability zones
  internet_gateway_name      = "pgr-igw"  # Custom Internet Gateway name
  nat_elastic_ip_name        = "pgr-nat-eip"
  aws_nat_gateway_name       = "pgr-nat-gw"
  public_route_table_name    = "pgr-pub-rt"
  private_route_table_name   = "pgr-private-rt"
}


