variable "name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    ports         = list(number)  # Multiple ports
    protocol      = string
    cidr_blocks   = optional(list(string), [])
    ipv6_cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
    self          = optional(bool, false)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    ports         = list(number)  # Multiple ports
    protocol      = string
    cidr_blocks   = optional(list(string), ["0.0.0.0/0"])
    ipv6_cidr_blocks = optional(list(string), ["::/0"])
    security_groups = optional(list(string), [])
    self          = optional(bool, false)
  }))
  default = [{
    ports       = [0]
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {}
}
