resource "aws_lb" "pgr-alb" {
    name = var.pgr_alb_name
    internal = var.pgr_alb_internal
    load_balancer_type = "application"
    security_groups = [var.pgr_alb_sg]
    subnets = var.pgr_alb_subnets
    enable_deletion_protection = true
    enable_cross_zone_load_balancing = true
    access_logs {
      bucket = var.pgr-alb_accessLogs
    }

    tags = {
      Name = "${var.pgr_alb_name}"
    }  
}



