module "networking" {
  source               = "./networking"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  http_port            = var.http_port
  https_port           = var.https_port
  allowed_http_cidr    = var.allowed_http_cidr
  allowed_https_cidr   = var.allowed_https_cidr
  web_server_port      = var.web_server_port
  hosted_zone_id       = var.hosted_zone_id
  alb_dns_name         = module.compute.wf_alb_dns_name # Pass from compute module
  alb_zone_id          = module.compute.wf_alb_zone_id  # Pass from compute module
}


module "compute" {
  source                = "./compute"
  vpc_id                = module.networking.vpc_id
  public_subnets        = module.networking.public_subnets
  private_subnets       = module.networking.private_subnets
  alb_security_group_id = module.networking.wf_alb_sg_id
  web_security_group_id = module.networking.web_security_group_id
  public_subnet_ids     = module.networking.wf_public_subnet_ids
  alb_dns_name          = module.networking.wf_alb_dns_name
  alb_zone_id           = module.networking.wf_alb_zone_id

  # Compute variables
  instance_type      = var.instance_type
  ami_id             = var.ami_id
  min_instance_count = var.min_instance_count
  max_instance_count = var.max_instance_count
  #key_name           = var.key_name
  domain_name     = var.domain_name
  hosted_zone_id  = var.hosted_zone_id
  certificate_arn = var.certificate_arn
  #public_key         = var.public_key # Ensure public_key is passed to compute module
}
