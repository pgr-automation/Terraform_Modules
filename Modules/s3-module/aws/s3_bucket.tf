resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_accelerate_configuration" "bucket_accelerate_configuration" {
  count   = var.enable_accelerate ? 1 : 0
  bucket  = aws_s3_bucket.bucket.bucket
  status  = var.accelerate_status
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id

  # Conditionally use ACL or access_control_policy
  #acl = var.use_acl ? var.acl_value : null

  dynamic "access_control_policy" {
    for_each = var.use_access_control_policy ? [1] : []
    content {
      owner {
        id           = var.access_control_policy_config.owner.id
        display_name = lookup(var.access_control_policy_config.owner, "display_name", null)
      }

      dynamic "grant" {
        for_each = var.access_control_policy_config.grant
        content {
          grantee {
            type          = grant.value.grantee.type
            id            = lookup(grant.value.grantee, "id", null)
            email_address = lookup(grant.value.grantee, "email_address", null)
            uri           = lookup(grant.value.grantee, "uri", null)
          }
          permission = grant.value.permission
        }
      }
    }
  }

  # Ensure that expected_bucket_owner is a valid 12-digit AWS account ID
  expected_bucket_owner = var.use_expected_bucket_owner ? (
    length(var.expected_bucket_owner_id) == 12 ? var.expected_bucket_owner_id : null
  ) : null
}
