resource "aws_instance" "webserver" {
  count                     = var.instance_count
  ami                       = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = element(var.subnet_ids, count.index % length(var.subnet_ids))
  key_name                  = var.key_name
  associate_public_ip_address = var.associate_public_ip_address

  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
}
