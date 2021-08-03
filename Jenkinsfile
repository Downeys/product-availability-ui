pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'main', credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/Downeys/product-availability-ui.git'
            }
        }
        stage('Build') {
            steps {
                nodejs('NodeJS-16.6.1'){
                    sh "npm install"
                    sh "npm run build"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build . -t downeys/bcpa-ui:latest"
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'DOCKERHUB_CREDENTIALS', variable: 'DOCKERHUB_CREDENTIALS')]) {
                    sh "docker login -u downeys -p ${DOCKERHUB_CREDENTIALS}"
                }
                sh "docker push downeys/bcpa-ui"
            }
        }
    }
}