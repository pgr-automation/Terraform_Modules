# Create Public and Private subnets
resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_cidrs, count.index)
    map_public_ip_on_launch = true
    availability_zone = element(var.availability_zones, count.index)
    tags = {
        Name = "${var.public_subnet_name_prefix}-${count.index +1}"
    }
  
}

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidrs, count.index)
    availability_zone = element(var.availability_zones, count.index)
    tags = {
      Name = "${var.private_subnet_name_prefix}-${count.index +1}"
    }
}
