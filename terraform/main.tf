resource "aws_instance" "example" {
  ami           = "ami-0e8d228ad90af673b" # Replace with a region-specific AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "SimpleEC2Instance"
  }
}
