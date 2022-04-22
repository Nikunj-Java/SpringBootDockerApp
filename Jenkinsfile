def containerName="springbootdocker"
def tag="latest"
 
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
        sh "docker build -t $containerName:${env.BUILD_NUMBER} --pull --no-cache ."
        echo "Image build complete"
    }
    stage ('Run Application') {
    try {
      // Stop existing Container
       //sh 'docker rm $containerName -f'
      // Start database container here
      sh "docker run -d --name $containerName $containerName:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }



     
	
 
}
