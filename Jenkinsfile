pipeline {
agent any

stages {
// stage('Checkout') {
// steps {
// // Clone the repository from GitHub
// url: 'https://github.com/Deepika1992623/spring-petclinic.git'
// }
// }

stage('Build'){
steps {
// Build the Java project
sh 'mvn clean package'
}
}

stage('Test') {
steps {
// Run tests for the Java project
sh 'mvn test'
}
}

stage('Deploy') {
steps {
// Deploy the Java project
sh 'mvn deploy'
}
}

stage('Docker Build') {
steps {
// Build Docker image
sh 'docker build -t deepika1993/spring-jenkin:v1 .'

// Push the Docker image to the registry
sh 'cd docker push deepika1993/spring-jenkin:v1'

// Run the docker container
sh 'docker run --name maven-build -d deepika1993/spring-jenkin:v1'

sh 'sleep 20'
sh 'docker ps'
sh 'docker images'
}
}

stage('Cleaning') {
steps {
// Stopping docker container
sh 'docker stop maven-build'

// Deleting docker container
sh 'docker rm maven-build'

// Deleting docker image
sh 'docker rmi deepika1993/spring-jenkin:v1'
}
}


//post {

//always {
// Archive artifacts
//archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true

// Test reports
//junit '**/target/surefire-reports/*.xml'
//}
//}
}
}
