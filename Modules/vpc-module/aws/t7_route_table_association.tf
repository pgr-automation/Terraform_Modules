### Route_table_association for Public and Private subnets

resource "aws_route_table_association" "public_association" {
  count = length(aws_subnet.public)
  subnet_id = element(aws_subnet.public.*.id, count.index)  
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_assocication" {
  count = length(aws_subnet.private)
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
  depends_on = [ aws_nat_gateway.nat-gw, aws_eip.nat_elastic_ip ]

  
}