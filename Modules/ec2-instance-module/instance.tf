provider "aws" {
  region = "us-east-1"
  
}

module "ec2_instance" {
  source                     = "./aws"  
  ami                        = "ami-06b21ccaeff8cd686"
  instance_type              = "t2.micro"
  subnet_id                  = [ "subnet-01260314a37a81914", "subnet-0aa50f5ad3a90ce63" ]
  key_name                   = "devops_key"
  security_group_ids         = ["sg-059757702575daec0"]
  associate_public_ip_address = true
  instance_name              = "Web-Server"
  instance_count             = 2
  ebs_volume_size = 10
  ebs_volume_type = "gp2"
  ebs_device_name = "/dev/xvda"
}

output "formatted_instance_details" {
  value = [
    for detail in module.ec2_instance.instance_details : "Instance-Name=${detail.name}, Instance-ID=${detail.id}, Instance Public-IP=${detail.public_ip}, Instance Private-IP=${detail.private_ip}"
  ]
}