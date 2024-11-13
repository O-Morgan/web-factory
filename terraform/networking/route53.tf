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

# DNS validation records in Route 53 for ACM certificate
resource "aws_route53_record" "acm_validation" {
  for_each = { for dvo in aws_acm_certificate.wf_certificate.domain_validation_options : dvo.domain_name => dvo }
  zone_id  = var.hosted_zone_id
  name     = each.value.resource_record_name
  type     = each.value.resource_record_type
  records  = [each.value.resource_record_value]
  ttl      = 60
}

# Route 53 record for www subdomain, pointing to ALB
resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = "www"
  type    = "A"
  alias {
    name                   = var.alb_dns_name # Updated to use variable
    zone_id                = var.alb_zone_id  # Updated to use variable
    evaluate_target_health = true
  }
}

# Route 53 record for root domain, pointing to ALB
resource "aws_route53_record" "root" {
  zone_id = var.hosted_zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = var.alb_dns_name # Updated to use variable
    zone_id                = var.alb_zone_id  # Updated to use variable
    evaluate_target_health = true
  }
}

# Wait for ACM certificate validation
resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  description             = "Validation for ACM certificate"
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}
