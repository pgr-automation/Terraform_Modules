resource "aws_lb_target_group" "alb_tg" {
  name = var.aws_lb_target_group_name
  port = var.aws_lb_target_group_port
  target_type = var.aws_lb_target_group_type
  protocol = var.aws_lb_target_group_protocol
  vpc_id = var.alb_vpc

  health_check {
    protocol = var.aws_lb_target_group_health_check_protocol
    path = var.aws_lb_target_group_health_check_path
    port = var.aws_lb_target_group_health_check_port
    healthy_threshold = var.aws_lb_target_group_health_check_healthy_threshold
    unhealthy_threshold = var.aws_lb_target_group_health_check_unhealthy_threshold
    timeout = var.aws_lb_target_group_health_check_timeout
    interval = var.aws_lb_target_group_health_check_interval
    matcher = var.aws_lb_target_group_health_check_matcher
  }
}