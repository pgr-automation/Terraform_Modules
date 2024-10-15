# Terraform Modules

## Create EC2 instance

```hcl

provider "aws" {
  region = "us-east-1"
}

module "ec2_instances" {
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
```
