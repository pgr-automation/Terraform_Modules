variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID to launch the instance."
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key to connect to the instance."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to launch the instance in."
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs of security groups to associate with the instance."
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance."
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "Whether to enable detailed monitoring."
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "The Availability Zone to launch the instance in."
  type        = string
  default = ""
}

variable "tenancy" {
  description = "The tenancy of the instance (e.g. default or dedicated)."
  type        = string
  default     = "default"
}

variable "user_data" {
  description = "User data to initialize the instance with."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to assign to the instance."
  type        = map(string)
  default     = {}
}

variable "iam_instance_profile" {
  description = "IAM instance profile to associate with the instance."
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size in GiB."
  type        = number
  default     = null
}

variable "root_volume_type" {
  description = "Root volume type."
  type        = string
  default     = ""
}

variable "root_volume_delete_on_termination" {
  description = "Whether to delete the root volume on instance termination."
  type        = bool
  default     = true
}

variable "ebs_device_name" {
  description = "Device name for the EBS volume."
  type        = string
  default     = ""
}

variable "ebs_volume_size" {
  description = "EBS volume size in GiB."
  type        = number
  default     = null
}

variable "ebs_volume_type" {
  description = "EBS volume type."
  type        = string
  default     = ""
}

variable "ebs_delete_on_termination" {
  description = "Whether to delete the EBS volume on instance termination."
  type        = bool
  default     = true
}

variable "cpu_credits" {
  description = "The CPU credit specification for the instance."
  type        = string
  default     = ""
}

variable "network_interface_id" {
  description = "ID of the network interface to associate with the instance."
  type        = string
  default     = ""
}

variable "private_ips" {
  description = "Private IP addresses to associate with the network interface."
  type        = list(string)
  default     = []
}

variable "ami_device_name" {
  description = "Device name for the AMI block device."
  type        = string
  default     = ""
}

variable "snapshot_id" {
  description = "Snapshot ID to use for the AMI block device."
  type        = string
  default     = ""
}

variable "ami_volume_size" {
  description = "Volume size for the AMI block device."
  type        = number
  default     = null
}

variable "ami_volume_type" {
  description = "Volume type for the AMI block device."
  type        = string
  default     = ""
}

variable "prevent_destroy" {
  description = "Whether to prevent the instance from being destroyed."
  type        = bool
  default     = false
}

variable "wait_for_capacity_timeout" {
  description = "The amount of time to wait for the instance to be ready."
  type        = string
  default     = ""
}

variable "metadata_http_tokens" {
  description = "Whether to require the instance metadata service to use tokens."
  type        = string
  default     = "required"
}

variable "metadata_http_endpoint" {
  description = "Whether to enable the instance metadata service endpoint."
  type        = string
  default     = "enabled"
}

variable "instance_name" {
  description = "Name of the EC2 instance."
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Number of instances to launch."
  type        = number
  default     = 1
  
}
variable "all_tags" {
  description = "Custom tags to apply to EC2 instances"
  type        = map(string)
  default     = {}
}

