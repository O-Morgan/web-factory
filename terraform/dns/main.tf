# DNS Module Main
module "certificate" {
  source         = "./certificate"
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
}

module "route53" {
  source         = "./route53"
  domain_name    = var.domain_name
  hosted_zone_id = var.hosted_zone_id
  alb_dns_name   = var.alb_dns_name
  alb_zone_id    = var.alb_zone_id
}
