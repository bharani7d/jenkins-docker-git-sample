pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/bharani7d/jenkins-docker-git-sample.git'
            }
        }

        stage('Verify Workspace') {
            steps {
                echo 'Listing files in workspace...'
                sh 'ls -la'
            }
        }

        stage('Test Python App') {
            steps {
                echo 'Running Python app...'
                sh 'python3 app.py || true'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-sample-app .'
            }
        }
    }

    post {
        success {
            echo '✅ Build succeeded!'
        }
        failure {
            echo '❌ Build failed. Check the console output.'
        }
    }
}
