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
                bat "docker run ${IMAGE_REPO_NAME}:${IMAGE_TAG} /bin/bash"
                echo "Container running"

                }

            }
        }
    }
}



'''
node{
    stage('SCM Checkout'){
        git branch: 'main', url: 'https://github.com/martin-scantist/workspace-tools-POC'
        }
    stage('Build Docker Image'){
        sh 'docker build -t martinscantist/poc:1.0.0 .'
        }
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
            sh "docker login -u martinscantist -p ${dockerHubPwd}"
        }
            sh 'docker push martinscantist/poc:1.0.0'
   }
//    stage('Run Container on Dev Server'){
//      def dockerRun = 'docker run -p 8080:8080 -d --name my-app kammana/my-app:2.0.0'
//      sshagent(['dev-server']) {
//        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.18.198 ${dockerRun}"
//      }
//    }
}
'''
