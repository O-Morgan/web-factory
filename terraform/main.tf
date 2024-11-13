module "networking" {
  source              = "./networking"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
  http_port           = var.http_port
  https_port          = var.https_port
  allowed_http_cidr   = var.allowed_http_cidr
  allowed_https_cidr  = var.allowed_https_cidr
  web_server_port     = var.web_server_port
}
