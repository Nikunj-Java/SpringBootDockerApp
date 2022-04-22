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

     
	
 
}
