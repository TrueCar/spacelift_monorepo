terraform {
  backend "s3" {
    bucket     = "spacelift-poc-state-sandbox"
    key        = "s3/sandbox.tfstate"
    profile    = "sandbox"
    region     = "us-west-2"
    encrypt    = true
    kms_key_id = "arn:aws:kms:us-west-2:685635030619:alias/spacelift-poc-state"
  }
}