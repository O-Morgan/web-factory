terraform {
  cloud {
    organization = "Owen_Morgan"

    workspaces {
      name = "web-factory"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "web-factory"
      Environment = "production"
      ManagedBy   = "Terraform"
    }
  }
}
