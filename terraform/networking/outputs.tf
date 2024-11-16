output "wf_vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.wf_main_vpc.id
}

output "wf_public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.wf_public_subnet_1.id, aws_subnet.wf_public_subnet_2.id]
}

output "wf_private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [aws_subnet.wf_private_subnet_1.id, aws_subnet.wf_private_subnet_2.id]
}

output "wf_alb_sg_id" {
  description = "Security group ID for the ALB"
  value       = aws_security_group.wf_alb_sg.id
}

output "wf_web_sg_id" {
  description = "Security group ID for the Web Server"
  value       = aws_security_group.wf_web_sg.id
}


