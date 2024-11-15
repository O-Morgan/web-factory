output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.wf_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.wf_alb.zone_id
}

# compute/outputs.tf
output "certificate_arn" {
  description = "The ARN of the ACM certificate for HTTPS"
  value       = aws_acm_certificate.wf_certificate.arn
}
