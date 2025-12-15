resource "aws_route_table" "devops-007-routetable" {
    vpc_id = var.devops-007-vpc-id 
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.devops-007-igw-id
    }
    tags = {
      Name = var.devops-007-route-table-name
    }
}
resource "aws_route_table" "devops-007-routetable-private" {
    vpc_id = var.devops-007-vpc-id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = var.devops-007-nat-id
    }
    tags = {
      Name = var.devops-007-private-route-table-name
    }
}

resource "aws_route_table_association" "devops-007-public-subnet-association" {
    count = length(var.devops-007-public-subnet-ids)
    subnet_id = var.devops-007-public-subnet-ids[count.index].id
    route_table_id = aws_route_table.devops-007-routetable.id 
}

resource "aws_route_table_association" "devops-007-private-subnet-association" {
    count = length(var.devops-007-private-subnet-ids)
    subnet_id = var.devops-007-private-subnet-ids[count.index].id
    route_table_id = aws_route_table.devops-007-routetable-private.id
}