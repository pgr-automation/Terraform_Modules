output "tg-details" {
  value = {
    arn = aws_lb_target_group.pgr-tg.arn
    id  = aws_lb_target_group.pgr-tg.id
  }
}