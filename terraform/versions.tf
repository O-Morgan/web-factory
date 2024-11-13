terraform {
  required_version = "~> 1.9.8"
  backend "s3" {
    bucket         = "2345-webfactory-tf-backend-2345"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "WebFactoryTerraformLocks"
  }
}