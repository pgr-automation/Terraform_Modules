output "target_group_arn" {
    value = aws_lb_target_group.pgr-alb-tg.arn
  
}

output "alb_dns_name" {
  value = aws_lb.pgr-alb.dns_name
}

output "alb_arn" {
  value = aws_lb.pgr-alb.arn
}
