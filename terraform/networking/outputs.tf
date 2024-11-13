output "wf_alb_sg_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.wf_alb_sg.id
}

output "wf_public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  value       = [aws_subnet.wf_public_subnet_1.id, aws_subnet.wf_public_subnet_2.id]
}

output "wf_web_sg_id" {
  description = "ID of the Web Server Security Group"
  value       = aws_security_group.wf_web_sg.id
}