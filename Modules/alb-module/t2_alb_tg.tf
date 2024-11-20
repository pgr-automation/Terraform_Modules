resource "aws_lb_target_group" "pgr-alb-tg" {
  name = var.pgr_alb_tg_name
  port = var.pgr_alb_tg_port
  protocol = var.pgr_alb_tg_protocal
  vpc_id = var.pgr_alb_tg_vpc_id
  target_type = var.pgr_alb_tg_tpe

  health_check {
    healthy_threshold = var.pgr_alb_tg_healthy_threshold
    unhealthy_threshold = var.pgr_alb_tg_unhealthy_threshold
    timeout = var.pgr_alb_tg_timeout
    interval = var.pgr_alb_tg_interval
    path = var.pgr_alb_tg_health_check_path
    matcher = var.pgr_alb_tg_health_check_matcher
  }
  tags = {
    Environment = "${var.pgr_alb_tg_environment}"
    Project = "${var.pgr_alb_tg_project}"
  }
}

resource "aws_lb_target_group_attachment" "pgr_alb_tg_attachement" {
  count              = length(var.pgr_alb_tg_target_ids)
  target_group_arn   = aws_lb_target_group.pgr-alb-tg.arn
  target_id          = var.pgr_alb_tg_target_ids[count.index]
  port               = var.pgr_alb_tg_attachemen_port
}