pipeline {
    agent any 
    tools {
        maven 'maven'
    } 
    
    stages {
        stage('Build Code'){
            steps{
                echo "packaging the application"
                sh 'mvn package -Dmaven.test.skip'
            }
        }

        stage ("build docker image and push to docker hub") {
            steps {
                echo "building docker image and pushing to docker hub"
                withCredentials([usernamePassword(credentialsId:'docker-hub-id', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'docker build -t cloudhight/java-app:1.7 .'
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker push cloudhight/java-app:1.7'
                }
            }
        }

        stage ("build docker image and push to nexus") {
            steps {
                echo "building docker image and pushing to nexus"
                withCredentials([usernamePassword(credentialsId:'nexus-id', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'docker build -t 18.170.227.111:8082/app:1.3 .'
                    sh "echo $PASS | docker login -u $USER --password-stdin 18.170.227.111:8082"
                    sh 'docker push 18.170.227.111:8082/app:1.3'
                }
            }
        }

    }
}

