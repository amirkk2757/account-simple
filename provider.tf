# Instructions: Place your provider configuration below
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
  backend "s3" {
    bucket         = "sanbox-workload-tf-state-f17q"
    key            = "state/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    use_lockfile   = true
  }
}

# Provider definition for Oregon Region
provider "aws" {
  region = var.region

  # assume_role {
  #   role_arn     = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
  #   session_name = "tf-${var.region}"
  # }

  default_tags {
    tags = { Project = "Cloud WAN Workshop", Terraform = "Managed" }
  }
}