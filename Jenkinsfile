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
                        echo "creating infra"
                    '''
                }
            }
        }
    }
}