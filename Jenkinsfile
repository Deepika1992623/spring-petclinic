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
sh 'docker build -t Deepika/pipeline-1-java:$image_tag .'

// Push the Docker image to the registry
sh 'cd docker push Deepika/pipeline-1-java:$image_tag'

// Run the docker container
sh 'docker run --name maven-build -d Deepika/pipeline-1-java:$image_tag'

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
sh 'docker rmi Deepika/pipeline-1-java:$image_tag'
}
}


post {

always {
// Archive artifacts
archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true

// Test reports
junit '**/target/surefire-reports/*.xml'
}
}
}
}