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