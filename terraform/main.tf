module "networking" {
  source = "./terraform/networking" # Path to your nested configuration

  # Pass required variables to the module
  region = var.region
}
