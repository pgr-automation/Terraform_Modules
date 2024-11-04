
**Change values as per requirements**


```hcl
provider "aws" {
  region = "us-east-1"
  
}

module "pgr_target_group" {
  source               = "github.com/pgr-automation/Terraform_Modules/Modules/target-group-module/"
  region               = "us-west-2"  # Your desired region
  name                 = "pgr-target-group"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "vpc-05831f9e51be19737"  # Replace with your VPC ID
  target_type          = "instance"
  healthy_threshold    = 3
  unhealthy_threshold  = 3
  health_check_timeout = 5
  health_check_interval = 30
  health_check_path    = "/"
  tags = {
    Environment = "Dev"
    Project     = "Alpha"
  }

  ######## Mention target groups Directly ########
  target_ids = [
    "i-0d06445453e5e3f07",  # Replace with your EC2 instance ID(s)
                             # You can add multiple target IDs
  ]
}

```

### To use values from vars/modules - target groups

```hcl
  ####### Utilize with EC2 moudule ######
  # Pass instance IDs from EC2 module to the target group
  target_ids = module.ec2_instances.instance_ids
```