resource "aws_security_group" "wf_alb_sg" {
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.wf_main_vpc.id

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
    description = "Allow HTTP traffic from allowed CIDR"
  }

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_https_cidr]
    description = "Allow HTTPS traffic from allowed CIDR"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "WF_ALB_SG"
  }
}

resource "aws_security_group" "wf_web_sg" {
  description = "Security group for web servers in private subnets"
  vpc_id      = aws_vpc.wf_main_vpc.id

  ingress {
    from_port       = var.web_server_port
    to_port         = var.web_server_port
    protocol        = "tcp"
    security_groups = [aws_security_group.wf_alb_sg.id]
    description     = "Allow traffic from ALB security group"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "WF_Web_SG"
  }
}

