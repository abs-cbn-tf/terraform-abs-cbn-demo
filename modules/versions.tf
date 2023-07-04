terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"

   default_tags {
   tags = {
     Environment = "DEMO"
     Application     = "IMP"
   }
 }
}