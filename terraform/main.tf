# /workspaces/web-factory/terraform/main.tf

module "networking" {
  source = "./networking" # Relative path from main.tf within the terraform directory
  region = var.region
}

