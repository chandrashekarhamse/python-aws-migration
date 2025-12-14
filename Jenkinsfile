pipeline {
    agent {
        label 'ec2-linux-docker-agent'
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        DOCKER_IMAGE_NAME = "devops-007-aws-python-app"
        TF_DIR            = "infra"
        ECR_REGISTERY_URL = "375332747108.dkr.ecr.us-east-1.amazonaws.com"
    }
    stages {
        stage('Build the docker image') {
            steps {
                script {
                    sh "docker build -t ${env.DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage("Initialize terraform") {
            agent {
                docker {
                    image 'hashicorp/terraform:1.13'
                    args '--entrypoint="" -u root -v /var/run/docker.sock:/var/run/docker.sock -t'
                    reuseNode true
                }
            }
            steps {
                dir("${TF_DIR}") {
                    sh "terraform init"
                }
            }
        }
        stage('Create an ECR repo') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.13'
                    args '--entrypoint="" -u root -v /var/run/docker.sock:/var/run/docker.sock -t'
                    reuseNode true
                }
            }
            steps {
                dir('infra') {
                    sh "terraform apply --auto-approve -target=module.ecr"
                }
            }
        }
        stage("Push docker image to ECR") {
            steps {
                script {
                    env.ECR_REPO_URL = sh (
                        script: "terraform output -raw devops-007-aws_ecr_repository_name",
                        returnStdout: true
                    ).trim()
                    echo "ECR repo URL: ${env.ECR_REPO_URL}"
                }
            }
        }
    }
}