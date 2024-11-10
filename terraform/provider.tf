terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = var.region  # Reference a variable instead of GitHub Secrets directly
  
  default_tags {
    tags = {
      Project     = "web-factory"
      Environment = "production"  # Update as needed
      ManagedBy   = "Terraform"
    }
  }
}
