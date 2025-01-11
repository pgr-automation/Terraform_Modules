module "vpc" {
  source = "./aws"
  cidr_block = "12.0.0.0/16"
  vpc_name = "pgr-vpc"
  internet_gateway_name = "pgr-igw"
  public_subnet_cidrs = ["12.0.1.0/24"]
  public_subnet_name = "pgr-public-subnet"
  private_subnet_cidrs = ["12.0.2.0/24", "12.0.3.0/24"]
  private_subnet_name = "pgr-private-subnet"

}
