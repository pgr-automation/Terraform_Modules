variable "pgr_alb_tg_name" {
    description = " alb tg name"
    type = string
}
variable "pgr_alb_tg_port" {
    description = "alb tg port"
    type = number
}
variable "pgr_alb_tg_protocal" {
    description = "alb tg protocal"
    type = string
}
variable "pgr_alb_tg_vpc_id" {
    description = "alb tg vpc_id"
    type = string
}
variable "pgr_alb_tg_tpe" {
    description = "alb tg type"
    type = string
}

variable "pgr_alb_tg_healthy_threshold" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_unhealthy_threshold" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_timeout" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_interval" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_health_check_path" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_health_check_matcher" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_environment" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_project" {
    description = "alb tg type"
    type = string
}
variable "pgr_alb_tg_target_ids" {
  description = "A list of EC2 instance IDs to register with the target group."
  type        = list(string)
}
variable "pgr_alb_tg_attachemen_port" {
    description = " pgr_alb_tg_attachemen port"
    type = string
  
}
variable "pgr_alb_name" {
    description = "alb name"
    type = string

  
}

variable "pgr_alb_internal" {
    description = "alb name"
    type = bool
    default = false
    
  
}

variable "pgr_alb_sg" {
    description = "alb sg"
    type = list()
  
}
variable "pgr_alb_subnets" {
    description = "alb subnets"
  
}
