provider "aws" {
    region = "us-east-1"
    assume_role {
        role_arn = "arn:aws:iam::375332747108:role/terraform-admin-role"
    }
}