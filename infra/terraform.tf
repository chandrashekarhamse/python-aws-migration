terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "devops-007-deployment-bucket"
    key            = "devops-007-python-aws-app/terraform.tfstat"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}

