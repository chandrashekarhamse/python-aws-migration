resource "aws_eip" "devops-007-eip" {
    domain = "vpc"
    tags = {
        Name = var.devops-007-eip-name
    }
}

resource "aws_nat_gateway" "devops-007-nat-gateway" {
    allocation_id = aws_eip.devops-007-eip.id
    subnet_id = var.devops-007-private-subnet-id
    connectivity_type = "public"
    tags = {
      Name = var.devops-007-nat-gateway-name
    }
    depends_on = [ var.devops-007-igw-id ]
}