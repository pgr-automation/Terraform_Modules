variable "bucket_name" {
  description = "The name of the S3 bucket"
  default = ""
  type = string  
}
variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default = false
  type = bool
  
}
variable "enable_accelerate" {
  description = "A boolean that indicates whether the bucket has accelerate configuration enabled"
  default = false
  type = bool
  
}
variable "accelerate_status" {
  description = "The accelerate configuration of the bucket"
  default = "Suspended"
  type = string
  
}
variable "use_acl" {
  description = "Whether to use canned ACL"
  type        = bool
  default     = true
}
variable "acl_value" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
}
variable "use_access_control_policy" {
  description = "Whether to use access_control_policy"
  type        = bool
  default     = false
}

variable "access_control_policy_config" {
  description = "Access control policy configuration"
  type = object({
    owner = object({
      id           = string
      display_name = optional(string)
    })
    grant = list(object({
      grantee = object({
        type          = string
        id            = optional(string)
        email_address = optional(string)
        uri           = optional(string)
      })
      permission = string
    }))
  })
  default = null
}

variable "use_expected_bucket_owner" {
  description = "Whether to specify the expected bucket owner"
  type        = bool
  default     = false
}
variable "expected_bucket_owner_id" {
  description = "The account ID of the expected bucket owner"
  type        = string
  default     = null
}