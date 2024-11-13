#resource "aws_key_pair" "wf_web_server_key_pair" {
#  description = "Key pair for SSH access to web server instances"
#  key_name    = "wf_web_server_key_pair"
#  public_key  = var.public_key # Add your public SSH key here
#  tags = {
#    Name = "WF_Web_Server_Key_Pair"
#  }
#}

resource "aws_launch_configuration" "web_server_config" {
  name            = "wf_web_server_launch_config"
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = [var.web_security_group_id] # Use the variable

  # Other configurations...
}


# Encrypt the root block device
root_block_device {
  volume_type = "gp3"
  volume_size = 8
  encrypted   = true
}

# Require HTTP token for IMDS
metadata_options {
  http_tokens = "required"
}

tags = {
  Name = "WF_Web_Server_Config"
}
