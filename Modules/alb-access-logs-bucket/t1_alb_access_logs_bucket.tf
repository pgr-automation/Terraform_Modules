resource "aws_s3_bucket" "alb_access_log_bucket" {
    bucket = var.alb_accessLogs_s3_bucket
    tags = {
      Name = "${var.alb_accessLogs_s3_bucket}"
    }
  
}