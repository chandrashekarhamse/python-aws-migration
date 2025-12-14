module "ecr" {
  source                  = "./ecr"
  aws_ecr_repository_name = var.aws_ecr_repository_name
}
module "vpc" {
  source                = "./vpc"
  devops-007-vpc-name   = var.devops-007-vpc-name
  devops-007-cidr-range = var.devops-007-vpc-cidr-range
}

module "subnet" {
  source                         = "./subnet"
  devops-007-public-subnet-cidr  = var.devops-007-public-subnet-cidr
  devops-007-vpc-id              = module.vpc.devops-007-vpc-id
  devops-007-private-subnet-cidr = var.devops-007-private-subnet-cidr
}

module "igw" {
  source              = "./igw"
  devops-007-igw-name = var.devops-007-igw-name
  devops-007-vpc-id   = module.vpc.devops-007-vpc-id
}

output "devops-007-aws_ecr_repository_name" {
  description = "ECR repo url"
  value       = module.ecr.devops-007-ecr-repo-url
}
output "devops-007-vpc-id" {
  value = module.vpc.devops-007-vpc-id
}

output "devops-007-public-subnet-id" {
  value = module.subnet.devops-007-public-subnet-ids
}

output "name" {
  value = module.subnet.devops-007-private-subnet-ids
}