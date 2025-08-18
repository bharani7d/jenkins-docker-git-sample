pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the repo into workspace
                git branch: 'main', url: 'https://github.com/bharani7d/jenkins-docker-git-sample.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage running...'
                // Example: list files to confirm repo is cloned
                sh 'ls -la'
                // Add your build commands here, e.g., Docker build, Python scripts, etc.
            }
        }

        stage('Post-Build') {
            steps {
                echo 'Build finished successfully!'
            }
        }
    }

    post {
        failure {
            echo 'Build failed. Check the console output.'
        }
    }
}
