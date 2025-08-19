pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'bharani7d'
        IMAGE_NAME     = 'devops-docker-sample'
        // In Step 2 we will create Jenkins credentials with ID 'dockerhub'
        // that holds your DockerHub username/password or access token.
        REGISTRY_CRED  = 'dockerhub'
    }

    stages {
        stage('Checkout') {
            steps {
                // Uses the same repo this Jenkinsfile sits in
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build \
                    -t $DOCKERHUB_USER/$IMAGE_NAME:latest \
                    -t $DOCKERHUB_USER/$IMAGE_NAME:$BUILD_NUMBER \
                    .
                '''
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: REGISTRY_CRED, usernameVariable: 'DH_USER', passwordVariable: 'DH_PASS')]) {
                    sh '''
                      echo "$DH_PASS" | docker login -u "$DH_USER" --password-stdin
                      docker push $DOCKERHUB_USER/$IMAGE_NAME:latest
                      docker push $DOCKERHUB_USER/$IMAGE_NAME:$BUILD_NUMBER
                      docker logout
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished. Image: $DOCKERHUB_USER/$IMAGE_NAME"
        }
    }
}
