def containerName="springbootdocker"
def tag="latest"
def dockerHubUser="anujsharma1990"
def gitURL="https://github.com/anujdevopslearn/SpringBootDocker.git"

node {
	 
    
  stage('Checkout Source Code') {
    checkout scm
  }

    stage('Build'){
        sh "mvn clean install"
    }

    stage("Image Prune"){
         sh "docker image prune -f"
    }

    stage('Image Build'){
        sh "docker build -t $containerName:$tag --pull --no-cache ."
        echo "Image build complete"
    }

    

  stage ('Run Application') {
    try {
      // Stop existing Container
      //sh 'docker rm $containerName -f'
      // Start database container here
      sh "docker run -d --name $containerName docker_image:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }

     
	
 
}
