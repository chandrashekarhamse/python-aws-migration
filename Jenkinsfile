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
                    sh "terraform output "
                }
            }
        }
        stage("Push docker image to ECR") {
            steps {
                echo "login to ecr repo"
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 375332747108.dkr.ecr.us-east-1.amazonaws.com"
                echo "Tag the image"
                sh "docker tag devops-007-python-aws-ecr-repo:latest 375332747108.dkr.ecr.us-east-1.amazonaws.com/devops-007-python-aws-ecr-repo:latest"
                echo "Pushing the image to ecr"
                sh "docker push 375332747108.dkr.ecr.us-east-1.amazonaws.com/devops-007-python-aws-ecr-repo:latest"
            }
        }
    }
}