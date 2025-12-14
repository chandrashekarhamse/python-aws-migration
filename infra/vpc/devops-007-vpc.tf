resource "aws_vpc" "devops-007-vpc" {
    cidr_block = var.devops-007-vpc-name
    instance_tenancy = "default"
    tags = {
        Name = var.devops-007-cidr-range
    }
}