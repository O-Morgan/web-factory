resource "aws_autoscaling_group" "web_server_asg" {
  description          = "Auto Scaling Group for web server instances"
  launch_configuration = aws_launch_configuration.web_server_config.id
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.wf_private_subnet_1.id, aws_subnet.wf_private_subnet_2.id]
  health_check_type    = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "WF_Web_Server"
    propagate_at_launch = true
  }
}
