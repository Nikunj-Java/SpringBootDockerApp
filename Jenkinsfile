def containerName="spring_container"
def imageName="spring_image"
def tag="latest"
node {
	 
    
  stage('Checkout Source Code') {
    checkout scm
  }

   stage("Compilation") {
    sh "mvn clean install -DskipTests"
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
	      sh "docker run -d --name $containerName-${env.BUILD_NUMBER} -p 8082:8082 $imageName:${env.BUILD_NUMBER}"
	    } 
	   catch (error) {
	    } finally {
	      // Stop and remove database container here
	      
	    }
    }

 
     
	
 
}
