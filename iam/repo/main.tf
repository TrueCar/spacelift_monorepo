variable "aws_region" {
  type = string
}

variable "credentials_profile" {
  type = string
}

variable "environment" {
  type = string
}

provider "aws" {
  profile = var.credentials_profile
  region  = var.aws_region

  default_tags {
    tags = {
      purpose   = "spacelift-poc"
      team      = "infra"
      terraform = "spacelift_tf_iam"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
  }
}

module "iam" {
  source = "git::https://github.com/TrueCar/spacelift_tf_iam.git//config?ref=134463a6"

  aws_region          = var.aws_region
  environment         = var.environment
  credentials_profile = var.credentials_profile
}
