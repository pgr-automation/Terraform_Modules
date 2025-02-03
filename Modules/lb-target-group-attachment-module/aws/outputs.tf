output "lb_target_group_attachment_details" {
  description = "Load balancer target group attachment details"
  value = {
    target_group_arn = aws_lb_target_group_attachment.this.target_group_arn
    target_id        = aws_lb_target_group_attachment.this.target_id
    port             = aws_lb_target_group_attachment.this.port
  }
  
}