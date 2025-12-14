resource "aws_ecr_repository" "devops-007-ecr-repo" {
    #name = "devops-007-python-aws-ecr-repo"
    name = var.aws_ecr_repository_name
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}