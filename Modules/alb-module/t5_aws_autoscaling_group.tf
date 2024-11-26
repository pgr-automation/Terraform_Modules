resource "aws_autoscaling_group" "pgr-alb-asg" {
    desired_capacity = var.aws_desired_capacity
    max_size = var.aws_max_size
    min_size = var.aws_min_size
    vpc_zone_identifier = var.aws_lb_subnet_ids
    launch_template {
      id = var.aws_launch_template_id
      version = "${var.aws_launch_template_version}"
    }
    health_check_type = var.asg_health_check_type
    health_check_grace_period = var.asg_health_check_grace_period
    
    target_group_arns = [ aws_lb_target_group.alb_tg.arn ]
     
    tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }
}