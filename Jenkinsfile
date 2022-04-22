node {
  
  stage('Build'){
        sh "mvn clean install"
    }
  stage('Checkout Source Code') {
    checkout scm
  }

  

  stage ('Run Application') {
    try {
      // Stop existing Container
      sh 'docker rm docker_container -f'
      // Start database container here
      sh "docker run -d --name docker_container docker_image:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }
  
   
 }





  
