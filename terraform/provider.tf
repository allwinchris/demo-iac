provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }

  backend "s3" {
    bucket = "demo-wpa1"
    key    = "key/terraform.tfstate"
    region = "us-west-2"
  }
}