output "lb_target_group_details" {
  description = "Load balancer target group details"
  value = {
    target_group_arn      = aws_lb_target_group.this.arn
    target_group_name     = aws_lb_target_group.this.name
    target_group_port     = aws_lb_target_group.this.port
    target_group_protocol = aws_lb_target_group.this.protocol
    target_group_vpc_id   = aws_lb_target_group.this.vpc_id
  }

}

