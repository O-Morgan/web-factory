resource "aws_key_pair" "wf_web_server_key_pair" {
  description = "Key pair for SSH access to web server instances"
  key_name   = "wf_web_server_key_pair"
  public_key = var.public_key  # Add your public SSH key here
  tags = {
    Name = "WF_Web_Server_Key_Pair"
  }
}

resource "aws_launch_configuration" "web_server_config" {
  description     = "Launch configuration for web server instances"
  name            = "wf_web_server_launch_config"
  image_id        = "ami-0e8d228ad90af673b"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.wf_web_server_key_pair.key_name
  security_groups = [aws_security_group.wf_web_sg.id]
  user_data       = file("path/to/user-data.sh")

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "WF_Web_Server"
  }
}
