resource "aws_launch_template" "web_server_template" {
  name                   = "wf_web_server_template"
  instance_type          = var.instance_type
  image_id               = var.ami_id
  vpc_security_group_ids = [var.web_security_group_id]

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = "gp3"
      encrypted   = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web_server"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
