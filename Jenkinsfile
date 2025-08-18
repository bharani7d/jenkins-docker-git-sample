pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone repo to workspace
                git branch: 'main', url: 'https://github.com/bharani7d/jenkins-docker-git-sample.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage running...'
                // Add your build commands here, e.g., Docker build or tests
            }
        }
    }
}
