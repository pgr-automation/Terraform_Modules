## Create Elatic IP for Nat gateway
resource "aws_eip" "nat_elastic_ip" {
    domain = "vpc"
    tags = {
      Name = "${var.nat_elastic_ip_name}"
    } 
  
}
