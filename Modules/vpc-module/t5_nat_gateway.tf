## Create Nat gateway with allocation of Elatic IP and attach it to public subnet 
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_elastic_ip.id
  subnet_id = element(aws_subnet.public.*.id, 0)

  depends_on = [aws_eip.nat_elastic_ip,  aws_internet_gateway.igw ]
  tags = {
    Name = "${var.aws_nat_gateway_name}"
  }
  
}