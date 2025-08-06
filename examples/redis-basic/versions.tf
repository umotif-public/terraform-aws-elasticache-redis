terraform {
  required_version = ">= 1.0.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.3"
    }
  }
}
