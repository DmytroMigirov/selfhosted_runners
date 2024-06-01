provider "aws" {
  region = var.region
}

# Create remote state
terraform {
  backend "s3" {
    bucket = "states-bucket-512"
    region = "us-east-1"
    key    = "test/terraform.tfstate"
  }
}
