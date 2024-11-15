resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = "www"
  type    = "A"
  alias {
    name                   = aws_lb.wf_alb.dns_name
    zone_id                = aws_lb.wf_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "root" {
  zone_id = var.hosted_zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = aws_lb.wf_alb.dns_name
    zone_id                = aws_lb.wf_alb.zone_id
    evaluate_target_health = true
  }
}
