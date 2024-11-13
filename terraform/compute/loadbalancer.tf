# compute/loadbalancer.tf

resource "aws_lb" "wf_alb" {
  description        = "Application Load Balancer for web servers"
  name               = "wf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    Name = "WF_ALB"
  }
}

resource "aws_lb_listener" "https_listener" {
  description       = "HTTPS listener for the Application Load Balancer"
  load_balancer_arn = aws_lb.wf_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wf_alb_target_group.arn
  }
}
