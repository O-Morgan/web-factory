terraform {
  backend "s3" {
    bucket         = "2345-webfactory-tf-backend-2345" # Ensure this is the correct S3 bucket name
    key            = "terraform.tfstate"
    region         = "eu-west-2"                # Updated region to match your AWS setup
    dynamodb_table = "WebfactoryTerraformLocks" # Correct DynamoDB table name
  }
}