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

    stage('Push to Docker Registry'){
        withCredentials([usernamePassword(credentialsId: 'nikunj0510', usernameVariable: 'nikunj0510', passwordVariable: 'Nikunj@1412')]) {
            sh "docker login -u $dockerUser -p $dockerPassword"
            sh "docker tag $containerName:$tag $dockerUser/$containerName:$tag"
            sh "docker push $dockerUser/$containerName:$tag"
            echo "Image push complete"
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
