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
    type = string
  
}
variable "aws_lb_internal" {
  type = string
}
variable "aws_lb_load_balancer_type" {
  type = string
}

variable "aws_lb_subnets" {
    type = list(string)
  
}
variable "aws_lb_enable_deletion_protection" {
    type = string
  
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
variable "aws_launch_template_version" {
    type = string
    default = "$Latest"
  
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