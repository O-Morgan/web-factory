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

# compute/loadbalancer.tf

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

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.wf_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:eu-west-2:182399680009:certificate/8b3e293a-6854-46c3-bb2b-c602da5297ed"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wf_alb_target_group.arn
  }
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
