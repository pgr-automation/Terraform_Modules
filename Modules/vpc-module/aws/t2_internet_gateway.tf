## Create Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id ? aws_vpc.main.id : null
    tags = {
    Name = "${var.internet_gateway_name}"
    }
}