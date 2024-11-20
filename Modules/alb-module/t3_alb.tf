resource "aws_lb" "alb" {

    
    name = var.alb_name
    internal = var.alb_internal
    load_balancer_type = "application"
    security_groups = var.alb_security_group
    subnets = var.alb_subnets
    enable_deletion_protection = true
    enable_cross_zone_load_balancing = true
    access_logs {
    bucket = var.alb_accessLogs_s3_bucket
    }

    tags = {
      Name = "${var.alb_name}"
    }  
}



