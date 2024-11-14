# ACM Certificate for HTTPS on ALB
resource "aws_acm_certificate" "wf_certificate" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = ["www.${var.domain_name}"]
}

resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

output "certificate_arn" {
  value = aws_acm_certificate.wf_certificate.arn
}
