pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/sohampan24/nodejs-docker-devops-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t nodejs-app:v1 .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop mynodeapp || true'
                sh 'docker rm mynodeapp || true'
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --name mynodeapp -p 80:5006 nodejs-app:v1'
            }
        }
    }
}
