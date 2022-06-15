pipeline {
    agent any
    environment {
        IMAGE_REPO_NAME="martinscantist/poc"
        IMAGE_TAG="1.0.0"
    }
   
    stages {
        
        // Checkout Git
        stage('Cloning Git') {
            steps {
                git branch: 'main', url: 'https://github.com/martin-scantist/workspace-tools-POC'
                echo "Git cloned!"
                }
        }
  
        // Building Docker images
        stage('Building image and run it') {
            steps{
                script {
                    dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                    echo "Image built"
                    bat "docker run --name evilfile ${IMAGE_REPO_NAME}:${IMAGE_TAG} "
                    // bat "docker exec -it evilfile /bin/bash -c 'ls' "
                    echo "Container running"

                }

            }
        }

        // Check for evilfile
        stage('Check for evilfile') {
            steps{
                script {
                    bat "winpty docker exec -it evilfile /bin/bash "
                    ls
                    echo "evilfile found"

                }

            }
        }


    }
}

