module "ecr" {
    source = "./ecr"
    aws_ecr_repository_name = var.aws_ecr_repository_name
}

output "devops-007-aws_ecr_repository_name" {
    description = "ECR repo url"
    value = module.ecr.devops-007-ecr-repo-url
}