variable "name" {
  description = "The name of the target group attachment"
  type        = string
  
}
variable "target_group_arn" {
  description = "The ARN of the target group with which to register targets"
  type        = string
  
}
variable "target_id" {
  description = "The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container"
  type        = string
  
}
variable "port" {
  description = "The port on which targets receive traffic"
  type        = number  
  
}