terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = var.region # Ensure 'region' is set in variables.tf or provided as an input

  default_tags {
    tags = {
      Project     = "web-factory"
      Environment = "production" # Adjust this as needed
      ManagedBy   = "Terraform"
    }
  }
}