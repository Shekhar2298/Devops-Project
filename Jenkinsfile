pipeline {
    agent any

    environment {
        IMAGE_NAME = "shekhar2298/devops-static-site"
        TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Verify Files') {
            steps {
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Docker Images') {
            steps {
                sh 'docker images'
            }
        }
    }
}
