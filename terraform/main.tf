terraform {

  required_version = "~> 1.1"

  backend "s3" {
    bucket         = "123456789-tfstate"
    key            = "kumo/remote-development/terraform.tfstate"
    region         = "eu-central-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {

  region = var.region
  # assume_role {
  #   role_arn = local.remote_seed_role
  # }
  allowed_account_ids = ["132456798"] # replace account id

  default_tags {
    tags = local.common_tags
  }
  ignore_tags {
    key_prefixes = ["finops_"]
    keys = [
      "bayer:principal-id",
      "mon:principal-id",
    ]
  }
}
