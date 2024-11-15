output "wf_vpc_id" {
  value = aws_vpc.wf_main_vpc.id
}

output "wf_public_subnet_ids" {
  value = [aws_subnet.wf_public_subnet_1.id, aws_subnet.wf_public_subnet_2.id]
}

output "wf_private_subnet_ids" {
  value = [aws_subnet.wf_private_subnet_1.id, aws_subnet.wf_private_subnet_2.id]
}

output "certificate_arn" {
  value = aws_acm_certificate.wf_certificate.arn
}

