resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.min_instance_count
  max_size             = var.max_instance_count
  min_size             = var.min_instance_count
  vpc_zone_identifier  = var.private_subnets
  launch_configuration = aws_launch_configuration.web_server_config.id

  tag {
    key                 = "Name"
    value               = "WF_Web_Server"
    propagate_at_launch = true
  }
}
