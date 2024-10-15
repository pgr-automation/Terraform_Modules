variable "ami_id" {
  description = "The ID of the AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch the instances in different availability zones"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name to use for the instances"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the instances"
  type        = list(string)
  default     = []
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instances"
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "The base name tag to assign to the instances"
  type        = string
  default     = "MyEC2Instance"
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 3
}
