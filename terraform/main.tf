module "networking" {
  source = "./terraform/networkin" # Path to your nested configuration

  # Pass required variables to the module
  region = var.region
}
