variable "name" {
  description = "The name of the target group"
  type        = string
  
}
variable "port" {
  description = "The port on which targets receive traffic"
  type        = number
  
}
variable "protocol" {
  description = "The protocol to use for routing traffic to the targets"
  type        = string
  default     = "HTTP"
}
variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group"
  type        = string
}
variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "instance"
}
variable "load_balancing_algorithm_type" {
  description = "The load balancing algorithm determines how the load balancer selects targets when routing requests"
  type        = string
  default     = "round_robin"
}
variable "health_check_enabled" {
  description = "Indicates whether health checks are enabled"
  type        = bool
  default     = true
}
variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target"
  type        = number
  default     = 30
}
variable "health_check_path" {
  description = "The destination for the health check request"
  type        = string
  default     = "/"
}
variable "health_check_port" {
  description = "The port to use to connect with the target"
  type        = string
  default     = "traffic-port"
}
variable "health_check_protocol" {
  description = "The protocol to use to connect with the target"
  type        = string
  default     = "HTTP"
}
variable "health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}
variable "health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
  type        = number
  default     = 5
}
variable "health_check_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering the target unhealthy"
  type        = number
  default     = 2
}
# variable "create_before_destroy" {
#   description = "Whether to allow a target group to be destroyed and recreated during terraform apply"
#   type        = bool
#   default     = false
  
# }