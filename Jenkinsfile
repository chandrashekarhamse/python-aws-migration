pipeline {
    agent {
        label 'ec2-linux-docker-agent'
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        DOCKER_IMAGE_NAME = "devops-007-aws-python-app"
    }
    stages {
        stage('Build the docker image') {
            steps {
                sh '''
                    docker built -t ${env.DOCKER_IMAGE_NAME}
                '''
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
                    sh '''
                        terraform init 
                        terraform plan
                        terraform apply -target=module.ecr.aws_ecr_repository.devops-007-ecr-repo
                    '''
                }
            }
        }
    }
}