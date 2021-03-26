pipeline {
    agent any 
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MYSQL_ROOT_PASSWORD")
        DOCKER_PASSWORD = credentials("DOCKER_PASSWORD")
    }

    stages{
        stage("Install dependencies"){
            steps{
                sh "bash install.sh"
            }
        }
        stage("Build"){
            steps{
                sh "docker-compose build --parallel"
            }
        }
        stage("Push"){
            steps{
                sh "docker-compose push"
            }
            
        }
        stage("Deploy"){
            steps{
                sh "docker-compose up -d"
            }

        }
    }
}