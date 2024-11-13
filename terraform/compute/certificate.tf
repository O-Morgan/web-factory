# ACM Certificate for HTTPS on ALB
resource "aws_acm_certificate" "wf_certificate" {
  domain_name               = "infra-owen-morgan.com"
  validation_method         = "DNS"
  subject_alternative_names = ["www.infra-owen-morgan.com"]

  tags = {
    Name        = "WF_ACM_Certificate"
    Environment = "production"
  }
}

# DNS validation records in Route 53 for ACM certificate
resource "aws_route53_record" "acm_validation" {
  description = "DNS validation records for ACM certificate in Route 53"
  for_each    = { for dvo in aws_acm_certificate.wf_certificate.domain_validation_options : dvo.domain_name => dvo }
  zone_id     = var.hosted_zone_id
  name        = each.value.resource_record_name
  type        = each.value.resource_record_type
  records     = [each.value.resource_record_value]
  ttl         = 60
}

# Wait for the ACM certificate to be validated
resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  description             = "Validates the ACM certificate via DNS records in Route 53"
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

# Output for ACM Certificate ARN to use with ALB
output "certificate_arn" {
  description = "The ARN of the validated ACM certificate for use with ALB"
  value       = aws_acm_certificate.wf_certificate.arn
}
