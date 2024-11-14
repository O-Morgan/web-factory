# compute/autoscaling.tf

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity    = var.min_instance_count
  max_size            = var.max_instance_count
  min_size            = var.min_instance_count
  vpc_zone_identifier = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.web_server_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "WF_Web_Server"
    propagate_at_launch = true
  }
}
