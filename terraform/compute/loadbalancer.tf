# Application Load Balancer
resource "aws_lb" "wf_alb" {
  name               = "wf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  drop_invalid_header_fields = true

  tags = {
    Name = "WF_ALB"
  }
}

# Target Group for Load Balancer
resource "aws_lb_target_group" "wf_alb_target_group" {
  name     = "wf-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
  }

  tags = {
    Name = "WF_ALB_Target_Group"
  }
}

# HTTP Listener to Redirect to HTTPS
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.wf_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = aws_acm_certificate_validation.wf_certificate_validation.certificate_arn # Ensure validation completes

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wf_alb_target_group.arn
  }

  depends_on = [aws_acm_certificate_validation.wf_certificate_validation]

}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.wf_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}
