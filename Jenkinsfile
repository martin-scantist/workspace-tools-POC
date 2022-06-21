pipeline {
    agent any
    // environment {
    //     IMAGE_REPO_NAME="microsoft/poc"
    //     IMAGE_TAG="1.0.0"

    // }
   
    stages {
        
        // Checkout Git
        stage('Cloning Git') {
            steps {
                git branch: 'workspace-tools_v0.16.2-test', url: 'https://github.com/martin-scantist/workspace-tools.git'
                echo "Git cloned!"
                }
        }
  
        // Building Docker images
        stage('Run script') {
            steps{
                echo "running fix-1.sh"
                bat " /bin/bash fix-1.sh "

            }
        }

    }
}