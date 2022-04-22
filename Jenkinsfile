def containerName="springbootdocker"
def tag="latest"
def dockerHubUser="nikunj0510"
def gitURL="https://github.com/Nikunj-Java/SpringBootDockerApp.git"

node {
	 
    stage('Checkout Source Code') {
        checkout scm
    }

    stage('Build'){
        sh "mvn clean install"
    }

    stage('Create Docker Image') {
        docker.build("SpringBootAPP:${env.BUILD_NUMBER}")
        echo "Image build complete"
    }
      
    stage ('Run Application') {
    try {
      // Stop existing Container
      sh 'docker rm docker_container -f'
      // Start database container here
      sh "docker run -d --name docker_container SpringBootAPP:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }
}
