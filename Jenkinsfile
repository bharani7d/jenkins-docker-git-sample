pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/bharani7d/jenkins-docker-git-sample.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t bharani7d/sample-app .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push bharani7d/sample-app'
                }
            }
        }
    }
}