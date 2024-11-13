resource "aws_lb" "wf_alb" {
  description        = "Application Load Balancer for web servers"
  name               = "wf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.wf_alb_sg.id]
  subnets            = [aws_subnet.wf_public_subnet_1.id, aws_subnet.wf_public_subnet_2.id]

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
  certificate_arn   = aws_acm_certificate.wf_certificate.arn  # Use the ACM certificate

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wf_alb_target_group.arn
  }
}

