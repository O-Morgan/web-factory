resource "aws_instance" "example" {
  ami           = "ami-0e8d228ad90af673b" # Replace with a region-specific AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "SimpleEC2Instance"
  }

  root_block_device {
    volume_type = "gp3"
    encrypted   = true
  }

  metadata_options {
    http_tokens = "required" # Enforce IMDSv2
  }
} 