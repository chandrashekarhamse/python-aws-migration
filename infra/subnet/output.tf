output "devops-007-public-subnet-ids" {
    value = aws_subnet.devops-007-public-subnet[*].id
}

output "devops-007-private-subnet-ids" {
    value = aws_subnet.devops-007-private-subnet[*].id
}