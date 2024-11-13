# compute/loadbalancer.tf

resource "aws_lb" "wf_alb" {
  name               = "wf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  drop_invalid_header_fields = true # Drop invalid headers

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
