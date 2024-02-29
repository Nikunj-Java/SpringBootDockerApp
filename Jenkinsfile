def containerName="spring_container"
def imageName="spring_image"
def dockerHubUser="nikunj0510"
def tag="latest"
node {
	 
    
  stage('Checkout Source Code') {
    checkout scm
  }

   stage("Compilation") {
    sh "mvn clean install -DskipTests"
   }
 
    stage('Image Build'){
        sh "docker build -t $imageName:${env.BUILD_NUMBER} --pull --no-cache ."
        echo "Image build complete"
    }
   
    stage ('Run Application') {
	    try {
	      // Stop existing Container
	       //sh 'docker rm $containerName-${env.BUILD_NUMBER} -f'
	      // Start database container here
	      sh "docker run -d --name $containerName -p 8082:8082 $imageName:${env.BUILD_NUMBER}"
	     // sudo docker run -d --name mycontainer-${env.BUILD_NUMBER} -p 8082:8082 spring_container:5
	    } 
	   catch (error) {
	    } finally {
	      // Stop and remove database container here
	      
	    }
    }

    stage('Push to Docker Registry'){
        withCredentials([usernamePassword(credentialsId: 'dockerHubAccount', usernameVariable: 'dockerUser', passwordVariable: 'dockerPassword')]) {
            sh "docker login -u $dockerUser -p $dockerPassword"
            sh "docker tag $containerName:$tag $dockerUser/$containerName:$tag"
            sh "docker push $dockerUser/$containerName:$tag"
            echo "Image push complete"
        }
    }

 
     
	
 
}
