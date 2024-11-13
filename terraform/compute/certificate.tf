# ACM Certificate for HTTPS on ALB
resource "aws_acm_certificate" "wf_certificate" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["www.${var.domain_name}"]

  tags = {
    Name        = "WF_ACM_Certificate"
    Environment = "production"
  }
}

# Output for ACM Certificate ARN to use with ALB
output "certificate_arn" {
  description = "The ARN of the validated ACM certificate for use with ALB"
  value       = aws_acm_certificate.wf_certificate.arn
}
