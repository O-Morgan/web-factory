resource "aws_route53_record" "www" {
  zone_id = var.hosted_zone_id
  name    = "www"
  type    = "A"
  alias {
    name                   = module.compute.alb_dns_name
    zone_id                = module.compute.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "root" {
  zone_id = var.hosted_zone_id
  name    = ""
  type    = "A"
  alias {
    name                   = module.compute.alb_dns_name
    zone_id                = module.compute.alb_zone_id
    evaluate_target_health = true
  }
}
