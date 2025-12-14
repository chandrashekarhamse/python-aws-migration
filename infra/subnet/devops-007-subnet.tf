resource "aws_subnet" "devops-007-public-subnet" {
    count = length(var.devops-007-public-subnet-cidr)
    vpc_id = var.devops-007-vpc-id
    cidr_block = var.devops-007-public-subnet-cidr[count.index]
    map_public_ip_on_launch = true
    tags = {
        Name = "devops-007-public-subnet-${count.index + 1}"
    }
}

resource "aws_subnet" "devops-007-private-subnet" {
    count = length(var.devops-007-private-subnet-cidr)
    vpc_id = var.devops-007-vpc-id
    cidr_block = var.devops-007-private-subnet-cidr[count.index]
    tags = {
        Name = "devops-007-private-subnet-${count.index + 1}"
    }
}