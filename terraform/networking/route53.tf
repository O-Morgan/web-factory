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

# Check if validation records already exist before creating new ones
resource "aws_route53_record" "acm_validation" {
  for_each = { for dvo in aws_acm_certificate.wf_certificate.domain_validation_options : dvo.domain_name => dvo }
  zone_id  = var.hosted_zone_id
  name     = each.value.resource_record_name
  type     = each.value.resource_record_type
  records  = [each.value.resource_record_value]
  ttl      = 60

  lifecycle {
    # Prevent Terraform from re-creating this record if it already exists
    create_before_destroy = false
    prevent_destroy       = true
    ignore_changes        = all
  }
}

# Wait for ACM certificate validation if not already validated
resource "aws_acm_certificate_validation" "wf_certificate_validation" {
  certificate_arn         = aws_acm_certificate.wf_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]

  lifecycle {
    ignore_changes = [validation_record_fqdns]
  }
}

# Output for ACM Certificate ARN to use with ALB
output "certificate_arn" {
  description = "The ARN of the validated ACM certificate for use with ALB"
  value       = aws_acm_certificate.wf_certificate.arn
}
