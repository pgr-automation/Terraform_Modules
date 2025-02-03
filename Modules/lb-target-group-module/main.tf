module "name" {
  source = "./aws"
  name = "my-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-049de0339fbf741c9"
  target_type = "instance"
  load_balancing_algorithm_type = "round_robin"
  health_check_enabled = true
  health_check_interval = 30
  health_check_path = "/"
  health_check_port = "traffic-port"
  health_check_protocol = "HTTP"
  health_check_timeout = 5
  health_check_healthy_threshold = 5
  health_check_unhealthy_threshold = 2
  
}
output "target_group_details" {
  description = "Load balancer target group details"
  value = module.name.lb_target_group_details
  
  
}