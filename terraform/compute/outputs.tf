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
