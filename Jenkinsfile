pipeline {
    agent {
        label 'ec2-linux-docker-agent'
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        DOCKER_IMAGE_NAME  = "devops-007-aws-python-app"
        TF_DIR             = "infra"
        ECR_REGISTERY_URL  = "375332747108.dkr.ecr.us-east-1.amazonaws.com/devops-007-python-aws-ecr-repo"
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
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
        stage('Build the docker image') {
            steps {
                script {
                    sh "docker build -t ${env.DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage("Push docker image to ECR") {
            steps {
                script {
                    // Authenticate Docker to ECR
                    sh """
                        aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | \
                        docker login --username AWS --password-stdin ${ECR_REGISTERY_URL}
                        # Tag and push
                        docker tag ${DOCKER_IMAGE_NAME}:latest ${ECR_REGISTERY_URL}:latest
                        docker push ${ECR_REGISTERY_URL}:latest
                    """
                }
            }
        }
        stage("Deploy to ECS") {
            steps {
                script {
                    echo "Deploying to ecs"
                }
            }
        }
    }
}