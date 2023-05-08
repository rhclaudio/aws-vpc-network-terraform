terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

//provider "aws" {
//  region = var.region_name
//  default_tags {
//    tags = {
//      "Application" = "Kubernetes"
//      "Tool"        = "Terragrunt"
//    }
//  }
//}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/terragrunt-assume-role"
  }
  default_tags {
    tags = {
      "Application" = "Kubernetes"
      "Tool"        = "Terragrunt"
    }
  }
}