pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This ensures Jenkins clones your repo first
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/main']],
                          userRemoteConfigs: [[url: 'https://github.com/bharani7d/jenkins-docker-git-sample.git']]
                ])
            }
        }

        stage('Build') {
            steps {
                echo 'Build stage running...'
                // Add your build commands here
            }
        }
    }
}
