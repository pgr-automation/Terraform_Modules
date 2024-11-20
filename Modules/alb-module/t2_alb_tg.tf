resource "aws_lb_target_group" "alb-tg" {
  name = var.alb_target_group_name
  port = var.alb_tg_port
  protocol = var.alb_tg_protocal
  vpc_id = var.alb_tg_vpc_id
  target_type = var.alb_tg_type

  health_check {
    healthy_threshold = var.alb_tg_healthy_threshold
    unhealthy_threshold = var.alb_tg_unhealthy_threshold
    timeout = var.alb_tg_timeout
    interval = var.alb_tg_interval
    path = var.alb_tg_health_check_path
    matcher = var.alb_tg_health_check_matcher
  }
  tags = {
    Environment = "${var.alb_tg_environment}"
    Project = "${var.alb_tg_project}"
  }
}

resource "aws_lb_listener" "alb_http_listner" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
      type = "forword"
      target_group_arn = aws_lb_target_group.alb-tg.arn
    }
}
resource "aws_lb_listener" "alb_https_lister" {
  load_balancer_arn = aws_lb.alb.arn
  port = 443
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  default_action {
    type = "forword"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
  
}
  
