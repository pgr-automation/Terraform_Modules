resource "aws_lb" "aws_alb" {
    name = var.aws_lb_name
    internal = var.aws_lb_internal
    load_balancer_type = var.aws_lb_load_balancer_type
    security_groups = [ aws_security_group.alb_sg.id ]
    subnets = var.aws_lb_subnet_ids
    enable_deletion_protection = var.aws_lb_enable_deletion_protection
}
resource "aws_lb_listener" "aws_alb_lister" {
    load_balancer_arn = aws_lb.aws_alb.arn
    port = var.aws_lb_listener_port
    protocol = var.aws_lb_listener_protocol

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb_tg.arn

    }
    
}

  
