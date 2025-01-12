provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source = "./aws"

  bucket_name                   = "my-unique-bucket-name"
  force_destroy                 = true
  enable_accelerate             = true
  accelerate_status             = "Enabled"
  #acl_value                     = "public-read"
  use_access_control_policy     = true
  access_control_policy_config  = {
    owner = {
      id           = "owner-id"
      display_name = "owner-name"
    }
    grant = [
      {
        grantee = {
          type          = "CanonicalUser"
          id            = "grantee-id"
          email_address = "grantee-email@example.com"
          uri           = null
        }
        permission = "FULL_CONTROL"
      }
    ]
  }
  use_expected_bucket_owner     = true
  expected_bucket_owner_id     = "expected-owner-id"
}
