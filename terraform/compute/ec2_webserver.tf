#resource "aws_key_pair" "wf_web_server_key_pair" {
#  description = "Key pair for SSH access to web server instances"
#  key_name    = "wf_web_server_key_pair"
#  public_key  = var.public_key # Add your public SSH key here
#  tags = {
#    Name = "WF_Web_Server_Key_Pair"
#  }
#}

# compute/ec2_webserver.tf

resource "aws_launch_configuration" "web_server_config" {
  name            = "wf_web_server_launch_config"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.web_security_group_id]

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = "Web_Server"
    Environment = "production"
  }
}
