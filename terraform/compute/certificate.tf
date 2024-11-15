#certificate

resource "aws_acm_certificate" "wf_certificate" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["www.${var.domain_name}"]

  tags = {
    Name        = "WF_ACM_Certificate"
    Environment = "production"
  }
}

resource "aws_route53_record" "acm_validation" {
  for_each = { for dvo in aws_acm_certificate.wf_certificate.domain_validation_options : dvo.domain_name => dvo }
  zone_id  = var.hosted_zone_id
  name     = each.value.resource_record_name
  type     = each.value.resource_record_type
  records  = [each.value.resource_record_value]
  ttl      = 60
}

resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

output "certificate_arn" {
  description = "The ARN of the validated ACM certificate"
  value       = aws_acm_certificate.wf_certificate.arn
}
