module "vpc" {
  source = "./aws"
  cidr_block = "12.0.0.0/16"
  vpc_name = "pgr-vpc"
}