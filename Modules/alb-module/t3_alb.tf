resource "aws_lb" "pgr-alb" {
    name = var.pgr_alb_name
    internal = var.pgr_alb_internal
    load_balancer_type = "application"
    security_groups = [var.pgr_alb_sg]
    subnets = var.pgr_alb_subnets
    enable_deletion_protection = true

    tags = {
      Name = "${var.pgr_alb_name}"
    }  
}



