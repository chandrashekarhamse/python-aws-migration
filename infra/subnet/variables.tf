variable "devops-007-vpc-id" {
    type = string
    description = "Get the vpc id details from vpc module"
}

variable "devops-007-public-subnet-cidr" {
    type = list(string)
    description = "cidr range for public subnet"
}

variable "devops-007-private-subnet-cidr" {
    type = list(string)
    description = "cidr range for private subnet"
}