variable "alb_target_group_name" {
    description = " alb tg name"
    type = string
}

variable "alb_tg_port" {
    description = "alb tg port"
    type = number
}
variable "alb_tg_protocal" {
    description = "alb tg protocal"
    type = string
}
variable "alb_tg_vpc_id" {
    description = "alb tg vpc_id"
    type = string
}
variable "alb_tg_type" {
    description = "alb tg type"
    type = string
}

variable "alb_tg_healthy_threshold" {
    description = "alb tg type"
    type = string
    default = "2"
}
variable "alb_tg_unhealthy_threshold" {
    description = "alb tg type"
    type = string
    default = "2"
}   
variable "alb_tg_timeout" {
    description = "alb tg type"
    type = string
    default = "5"
}
variable "alb_tg_interval" {
    description = "alb tg type"
    type = string
    default = "30"

}
variable "alb_tg_health_check_path" {
    description = "alb tg type"
    type = string
    default = "/"
}
variable "alb_tg_health_check_matcher" {
    description = "alb tg type"
    type = string
    default = "200-399"
}
variable "alb_tg_environment" {
    description = "alb tg type"
    type = string
    default = "Test"
}
variable "alb_tg_project" {
    description = "alb tg type"
    type = string
    default = "Test"
}
variable "alb_tg_target_ids" {
  description = "A list of EC2 instance IDs to register with the target group."
  type        = list(string)
}

variable "alb_name" {
    description = "alb name"
    type = string

  
}

variable "alb_internal" {
    description = "alb name"
    type = bool
    default = false
    
  
}

variable "alb_security_group" {
    description = "alb sg"
    type = list(string)
  
}
variable "alb_subnets" {
    description = "alb subnets"
    type = list(string)
  
}

variable "alb_accessLogs_s3_bucket" {
    description = "s3 bucket to store alb logs"
    type = string
  
}