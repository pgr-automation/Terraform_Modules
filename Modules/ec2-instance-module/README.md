# Terraform Modules

## Create EC2 instance (One / More)  - You Need to write only below Code
 ## * Replace the values with your requirements.

```hcl
provider "aws" {
  region = "us-east-1"
  
}

module "ec2_instance" {
  source                     = "github.com/pgr-automation/Terraform_Modules//Modules/ec2-instance-module"  
  ami_id                     = "ami-06b21ccaeff8cd686"
  instance_type              = "t2.micro"
  subnet_ids                 = ["subnet-0a862bc92237aee82", "subnet-060ad16b0550c101c"]
  key_name                   = "ssh-grp-key"
  security_group_ids         = ["sg-08217f5b0808d824a"]
  associate_public_ip_address = true
  instance_name              = "Web-Server"
  instance_count             = 2
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
3. terraform apply  # To apply the Code for resource creation 
4. terraform destroy # To delete all the resources which is created by your terrafrom code.
```