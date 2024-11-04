resource "aws_lb_target_group" "pgr-tg" {
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type  # Set target type to 'instance'

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    path                = var.health_check_path
    matcher             = var.health_check_matcher
  }

  tags = var.tags
}

resource "aws_lb_target_group_attachment" "pgr-tg-attachement" {
  count              = length(var.target_ids)
  target_group_arn   = aws_lb_target_group.pgr-tg.arn
  target_id          = var.target_ids[count.index]
  port               = var.port
}