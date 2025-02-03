output "network_details" {
  description = "Network resource details"
  value = {
    vpc = {
      id = aws_vpc.main.id
    }
    internet_gateway = {
      id = aws_internet_gateway.igw.id
    }
    subnets = {
      public  = [for subnet in aws_subnet.public : subnet.id]
      private = [for subnet in aws_subnet.private : subnet.id]
    }
    nat_gateway = {
      id  = aws_nat_gateway.nat-gw.id
      eip = aws_eip.nat_elastic_ip.public_ip
    }
    route_tables = {
      public  = aws_route_table.public.id
      private = aws_route_table.private.id
    }
  }
}
