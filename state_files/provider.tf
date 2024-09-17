terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
    backend "s3" {
    bucket = "hemanthkumar-online-s3"
    key    = "testing"
    region = "us-east-1"
    dynamodb_table = "hemanthkumar.online_locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}