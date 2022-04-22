def containerName="springbootdocker"
def tag="latest"
def dockerHubUser="anujsharma1990"
def gitURL="https://github.com/anujdevopslearn/SpringBootDocker.git"

node {
	 
   stage('Build'){
        sh "mvn clean install"
    }
  
   stage('Checkout Source Code') {
    checkout scm
    }

  stage('Create Docker Image') {
    docker.build("$containerName:${env.BUILD_NUMBER}")
  }

  stage ('Run Application') {
    try {
      // Stop existing Container
      sh 'docker rm $containerName -f'
      // Start database container here
      sh "docker run -d --name $containerName $containerName:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }

     
	
 
}
