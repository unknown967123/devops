pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'yourdockerhubusername/java-rest-api'
        IMAGE_TAG = "v${env.BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/yourusername/java-rest-devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB_REPO:$IMAGE_TAG .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push $DOCKER_HUB_REPO:$IMAGE_TAG'
                }
            }
        }
    }
}
