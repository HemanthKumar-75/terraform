terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
    backend "s3" {
    bucket = "hemanthkumar-online-s3" # for every repo you need make this as unique
    key    = "testing" # this key is an unique value not the same details
    region = "us-east-1"
    dynamodb_table = "hemanthkumar.online_locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}