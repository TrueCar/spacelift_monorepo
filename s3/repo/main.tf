variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_profile" {
  type = string
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
  source = "git::https://github.com/TrueCar/spacelift_tf_s3.git//config?ref=653b30b"

  aws_region  = var.aws_region
  environment = var.environment
}