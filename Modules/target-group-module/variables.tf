variable "region" {
  description = "The AWS region to deploy the resources."
  type        = string
}

variable "name" {
  description = "The name of the target group."
  type        = string
}

variable "port" {
  description = "The port on which the targets receive traffic."
  type        = number
}

variable "protocol" {
  description = "The protocol for routing traffic to the targets."
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The ID of the VPC for the target group."
  type        = string
}

variable "healthy_threshold" {
  description = "The number of consecutive health checks successes required."
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "The number of consecutive health check failures required."
  type        = number
  default     = 3
}

variable "health_check_timeout" {
  description = "The amount of time, in seconds, to wait for a health check response."
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "The time between health checks, in seconds."
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/"
}

variable "health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response."
  type        = string
  default     = "200"
}

variable "tags" {
  description = "Tags to apply to the target group."
  type        = map(string)
  default     = {}
}

variable "target_ids" {
  description = "A list of EC2 instance IDs to register with the target group."
  type        = list(string)
}

variable "target_type" {
  description = ""
  type = string
  
}