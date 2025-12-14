resource "aws_internet_gateway" "devops-007-igw" {
    vpc_id = var.devops-007-vpc-id
    tags = {
        Name = var.devops-007-igw-name
    } 
}