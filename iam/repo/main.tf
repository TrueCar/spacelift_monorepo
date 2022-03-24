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

module "iam" {
  source = "git::https://github.com/TrueCar/spacelift_tf_iam.git//config?ref=856de87"

  aws_region  = var.aws_region
  environment = var.environment
}
