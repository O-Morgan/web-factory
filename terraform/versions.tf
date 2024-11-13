terraform {
  required_version = "~> 1.9.8"
  backend "s3" {
    bucket         = "2345-webfactory-tf-backend-2345"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "WebFactoryTerraformLocks"
  }
}