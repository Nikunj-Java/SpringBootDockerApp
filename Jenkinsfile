def containerName="springbootdocker"
def tag="latest"
def dockerHubUser="nikunj0510"
def gitURL="https://github.com/anujdevopslearn/SpringBootDocker.git"

node {
	
    stage('Checkout') {
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: gitURL]]]
    }

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
      sh 'docker rm docker_container -f'
      // Start database container here
      sh "docker run -d --name docker_container $containerName:${env.BUILD_NUMBER}"
    } 
	catch (error) {
    } finally {
      // Stop and remove database container here
      
    }
  }
	
	stage("SonarQube Scan"){
        withSonarQubeEnv(credentialsId: 'SonarQubeToken') {
			sh "${sonarscanner}/bin/sonar-scanner"
		}
    }
	
	stage("Ansible Deploy"){
        ansiblePlaybook inventory: 'hosts', playbook: 'deploy.yaml'
    }
}
