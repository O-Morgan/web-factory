terraform {
  required_version = "~> 1.9.8"
  backend "s3" {
    bucket         = "webfactory-tf-backend"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "WebFactoryTerraformLocks"
  }
}