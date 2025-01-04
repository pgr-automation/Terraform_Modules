# Terraform Modules

## Create EC2 instance (One / More)  - You Need to write only below Code
 ## * Replace the values with your requirements.

```hcl
provider "aws" {
  region = "us-east-1"
  
}

module "ec2_instance" {
  source                     = "github.com/pgr-automation/Terraform_Modules//Modules/ec2-instance-module//aws?ref=v1.0.0"  
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
```

## Terrafrom Commands
```bash
1. terraform init  # To initialize terraform
2. terraform validate # To validate your Code
3. terraform plan  # Check the resource plan before apply and validate
4. terraform apply  # To apply the Code for resource creation 
5. terraform destroy # To delete all the resources which is created by your terrafrom code.
```