## Create Public Route table with Internet gatway  
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    depends_on = [ aws_internet_gateway.igw ]
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "${var.public_route_table_name}"
    }
}


## Create Private Route table with Nat Gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  depends_on = [ aws_nat_gateway.nat-gw, aws_eip.nat_elastic_ip ]
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  
  }
  tags = {
    Name = "${var.private_route_table_name}"
  }  
}