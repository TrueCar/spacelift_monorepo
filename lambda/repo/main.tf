variable "aws_region" {
  type        = string
  description = "The AWS region"
}

variable "credentials_profile" {
  type = string
}

variable "name" {
  type = string
}

variable "security_group_id" {
  type        = string
  description = "Security group id for lambda functions."
}

variable "subnet_id" {
  type        = string
  description = "Subnet id for lambda functions"
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
  profile = var.credentials_profile
  region  = var.aws_region

  default_tags {
    tags = {
      purpose   = "spacelift_poc"
      team      = "infra"
      terraform = "spacelift_tf_lambda"
    }
  }
}

module "spcli_terminator" {
  source = "git::https://github.com/TrueCar/spacelift_tf_lambda.git//config?ref=9245ad6"

  aws_region          = var.aws_region
  credentials_profile = var.credentials_profile
  name                = var.name
  security_group_id   = var.security_group_id
  subnet_id           = var.subnet_id
}
