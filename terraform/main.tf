terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::654654554686:role/DevOpsaNaNuvemWeekTerraformRole"
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "kenerry"
  assume_role {
    role_arn = "arn:aws:iam::968225077300:role/DevOpsaNaNuvemWeekTerraformRole"
  }
}