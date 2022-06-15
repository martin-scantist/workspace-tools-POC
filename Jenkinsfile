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

                    // to chain commands in container
                    bat "docker run --rm --name evilfile ${IMAGE_REPO_NAME}:${IMAGE_TAG} bash -c './fix.sh' "
                    echo "Container running"
                    // bat "docker exec ${IMAGE_REPO_NAME}:${IMAGE_TAG} /bin/bash "
                    // bat "docker run --name evilfile ${IMAGE_REPO_NAME}:${IMAGE_TAG} /bin/bash "
                    // bat "docker exec evilfile bash -c 'ls ; pwd ' "
                    // docker exec <container> bash -c "command1 ; command2 ; command3"
                    echo "Container exited"

                }

            }
        }

        // Check for evilfile
        // stage('Check for evilfile') {
        //     steps{
        //         script {
        //             bat "docker start evilfile "
        //             bat "docker exec -it evilfile /bin/bash "
        //             ls
        //             echo "evilfile found"

        //         }

        //     }
        // }


    }
}

