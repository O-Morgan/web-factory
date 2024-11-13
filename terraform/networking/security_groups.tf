resource "aws_security_group" "wf_alb_sg" {
  vpc_id = aws_vpc.wf_main_vpc.id
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_https_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WF_ALB_SG"
  }
}

resource "aws_security_group" "wf_web_sg" {
  vpc_id = aws_vpc.wf_main_vpc.id
  ingress {
    from_port       = var.web_server_port
    to_port         = var.web_server_port
    protocol        = "tcp"
    security_groups = [aws_security_group.wf_alb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WF_Web_SG"
  }
}
