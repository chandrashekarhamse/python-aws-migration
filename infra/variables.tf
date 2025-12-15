variable "aws_ecr_repository_name" {
  type        = string
  description = "AWS ECR repository name"
}

variable "devops-007-vpc-cidr-range" {
  type        = string
  description = "vpc cidr range"
}

variable "devops-007-vpc-name" {
  type        = string
  description = "VPC name"
}

variable "devops-007-public-subnet-cidr" {
  type        = list(string)
  description = "devops public cidr block ip range"
}

variable "devops-007-private-subnet-cidr" {
  type        = list(string)
  description = "devops private cidr block range"
}

variable "devops-007-igw-name" {
  type        = string
  description = "igw name"
}

variable "devops-007-route-table-name" {
  type        = string
  description = "route table name"
}

variable "devops-007-private-route-table-name" {
  type        = string
  description = "private route table name"
}

variable "devops-007-eip-name" {
  type        = string
  description = "EIP name"
}

variable "devops-007-nat-gateway-name" {
  type        = string
  description = "NAT gateway name"
}