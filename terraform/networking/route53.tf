# DNS validation records in Route 53 for ACM certificate
resource "aws_route53_record" "acm_validation" {
  for_each = { for dvo in aws_acm_certificate.wf_certificate.domain_validation_options : dvo.domain_name => dvo }
  zone_id  = var.hosted_zone_id
  name     = each.value.resource_record_name
  type     = each.value.resource_record_type
  records  = [each.value.resource_record_value]
  ttl      = 60
}

# Wait for ACM certificate validation
resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

# Route 53 record for www subdomain, pointing to ALB
resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = "www"
  type    = "A"
  alias {
    name                   = var.alb_dns_name # Pass alb_dns_name from networking outputs
    zone_id                = var.alb_zone_id  # Pass alb_zone_id from networking outputs
    evaluate_target_health = true
  }
}

# Route 53 record for root domain, pointing to ALB
resource "aws_route53_record" "root" {
  zone_id = var.hosted_zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = var.alb_dns_name # Pass alb_dns_name from networking outputs
    zone_id                = var.alb_zone_id  # Pass alb_zone_id from networking outputs
    evaluate_target_health = true
  }
}

# Output for ACM Certificate ARN to use with ALB in compute module
output "certificate_arn" {
  description = "The ARN of the validated ACM certificate for use with ALB"
  value       = aws_acm_certificate.wf_certificate.arn
}
