```hcl
provider "aws" {
    region = "us-east-1" 
}

module "aws_lb_alb" {
    source = "github.com/pgr-automation/Terraform_Modules/Modules/alb-module"
    alb_vpc = var.alb_vpc
    aws_security_group_name = var.aws_security_group_name
### Target group configureation
    aws_lb_target_group_name = var.aws_lb_target_group_name
    aws_lb_target_group_port = var.aws_lb_target_group_port
    aws_lb_target_group_type = var.aws_lb_target_group_type
    aws_lb_target_group_protocol = var.aws_lb_target_group_protocol
    aws_lb_target_group_health_check_protocol = var.aws_lb_target_group_health_check_protocol
    aws_lb_target_group_health_check_path = var.aws_lb_target_group_health_check_path
    aws_lb_target_group_health_check_port = var.aws_lb_target_group_health_check_port
    aws_lb_target_group_health_check_healthy_threshold = var.aws_lb_target_group_health_check_healthy_threshold
    aws_lb_target_group_health_check_unhealthy_threshold = var.aws_lb_target_group_health_check_unhealthy_threshold
    aws_lb_target_group_health_check_timeout = var.aws_lb_target_group_health_check_timeout
    aws_lb_target_group_health_check_interval = var.aws_lb_target_group_health_check_interval
    aws_lb_target_group_health_check_matcher = var.aws_lb_target_group_health_check_matcher
### ALB COnfiguration
    aws_lb_name = var.aws_lb_name
    aws_lb_internal = var.aws_lb_internal
    aws_lb_load_balancer_type = var.aws_lb_load_balancer_type
    aws_lb_subnets = var.aws_lb_subnet_ids
    aws_lb_enable_deletion_protection = var.aws_lb_enable_deletion_protection
    aws_lb_listener_port = var.aws_lb_listener_port
    aws_lb_listener_protocol = var.aws_lb_listener_protocol
    
###Launch template
    aws_launch_template_id = var.aws_launch_template_id
### ASG Configuration
    aws_lb_subnet_ids =  var.aws_lb_subnet_ids 
    asg_health_check_type = var.asg_health_check_type
    asg_health_check_grace_period = var.asg_health_check_grace_period

}
```

### tfvars
```hcl
aws_security_group_name = "pgr-alb-sghttp"
alb_vpc = "vpc-05831f9e51be19737"

######## AWS LB TG ############
aws_lb_target_group_name = "pgr-alb-tg"
aws_lb_target_group_port = "80"
aws_lb_target_group_type = "instance"
aws_lb_target_group_protocol = "HTTP" 


   ## Health Checks#################
aws_lb_target_group_health_check_protocol = "HTTP"
aws_lb_target_group_health_check_path = "/"
aws_lb_target_group_health_check_port = "80"
aws_lb_target_group_health_check_healthy_threshold = "5" 
aws_lb_target_group_health_check_unhealthy_threshold = "2"
aws_lb_target_group_health_check_timeout = "3"
aws_lb_target_group_health_check_interval = "5"
aws_lb_target_group_health_check_matcher = "200"

######### alb #######
aws_lb_name = "pgr-alb"
aws_lb_internal = "false"
aws_lb_load_balancer_type = "application"
aws_lb_subnets = ["us-east-1a", "us-east-1b"]
aws_lb_enable_deletion_protection = "false"

######listners ####

aws_lb_listener_port = "80"
aws_lb_listener_protocol = "HTTP"


#####ASG configurations

asg_health_check_type = "EC2"
asg_health_check_grace_period = 300
aws_lb_subnet_ids = [ "subnet-0a862bc92237aee82","subnet-060ad16b0550c101c" ]

### Lauch template
aws_launch_template_id = "lt-08f83a557f08ea74e"
```

### variables.tf
```hcl
variable "aws_security_group_name" {
    description = "aws_security_group"
    type = string
  
}
variable "alb_vpc" {
    description = "alb vpc"
    type = string
  
}

variable "aws_lb_target_group_name" {
    description = "aws_lb_target_group"
    type = string
  
}

variable "aws_lb_target_group_port" {
    description = "aws_lb_target_port"
    type = string
  
}

variable "aws_lb_target_group_type" {
    description = "aws_lb_target_type"
    type = string
  
}
variable "aws_lb_target_group_protocol" {
    description = "aws_lb_target_protocal"
    type = string
  
}
variable "aws_lb_target_group_health_check_protocol" {
    description = "aws_lb_target_group_health_check_protocal"
    type = string
  
}
variable "aws_lb_target_group_health_check_port" {
    description = "aws_lb_target_group_health_check_por"
    type = string
  
}
variable "aws_lb_target_group_health_check_path" {
    description = ""
    type = string
  
}
variable "aws_lb_target_group_health_check_healthy_threshold" {
    description = ""
    type = string
  
}
variable "aws_lb_target_group_health_check_unhealthy_threshold" {
    description = ""
    type = string
  
}

variable "aws_lb_target_group_health_check_timeout" {
    description = ""
    type = string
  
}
variable "aws_lb_target_group_health_check_interval" {
    description = ""
    type = string
  
}
variable "aws_lb_target_group_health_check_matcher" {
    description = ""
    type = string
  
}

variable "aws_lb_name" {
  
}
variable "aws_lb_internal" {
  
}
variable "aws_lb_load_balancer_type" {
  
}

variable "aws_lb_subnets" {
    type = list(string)
  
}
variable "aws_lb_enable_deletion_protection" {
  type = bool
  default = false
}
variable "aws_lb_listener_port" {
  type = string

}
variable "aws_lb_listener_protocol" {
  type = string
}



variable "aws_launch_template_id"{
    type = string
  
}

variable "aws_desired_capacity" {
    type = number
    default = 2
  
}
variable "aws_max_size" {
    type = number
    default = 2
  
}

variable "aws_min_size" {
  type = number
  default = 1
}

variable "aws_launch_template_version" {
    type = string
    default = "$Latest"
  
}
variable "aws_propagate_at_launch" {
    type = bool
    default = false
  
}
variable "asg_health_check_type" {
    type = string
    default = "EC2"
  
}
variable "asg_health_check_grace_period" {
  type = number
  default = 300
}

variable "aws_lb_subnet_ids" {
    type = list(string)
  
}
```