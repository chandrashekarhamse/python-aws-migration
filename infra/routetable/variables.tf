variable "devops-007-route-table-name" {
    type = string
    description = "Route table name"
}

variable "devops-007-vpc-id" {
    type = string
    description = "vpc id"
}

variable "devops-007-igw-id" {
    type = string
    description = "igw id"
}

variable "devops-007-private-route-table-name" {
    type = string
    description = "Private route table name"
}

variable "devops-007-nat-id" {
    type = string
    description = "nat gateway id"
}

variable "devops-007-public-subnet-ids" {
    type = list(string)
    description = "public subnet ids"
}

variable "devops-007-private-subnet-ids" {
    type = list(string)
    description = "private subnet ids"
}