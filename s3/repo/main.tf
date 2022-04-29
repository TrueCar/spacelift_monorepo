variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_profile" {
  type = string
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

  default_tags {
    tags = {
      purpose   = "spacelift_poc"
      team      = "infra"
      terraform = "spacelift_tf_s3"
    }
  }
}

module "s3" {
  source = "git::https://github.com/TrueCar/spacelift_tf_s3.git//config?ref=d36a812"

  aws_region  = var.aws_region
  environment = var.environment
}
