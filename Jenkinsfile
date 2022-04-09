pipeline {
    agent any

    stages {
        stage('Fetch Guthub Code') {
            steps {
                git branch: 'main', credentialsId: 'github_pass_token', url: 'https://github.com/RaviPatel0/java-spring-boot-maven.git'
            }
        }
    
        stage('Copy Image & Deploy App'){
            steps{
                script{
                    def remote = [:]
                        remote.name = 'app_server'
                        remote.host = '54.163.150.143'
                        remote.user = 'root'
                        remote.identityFile = "/var/lib/jenkins/.ssh/id_rsa.pem"
                        remote.allowAnyHosts = true
                        sshPut remote: remote, from: './docker-compose.yaml', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './pom.xml', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './src', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './Dockerfile', into: '/home/ubuntu/java-maven-app'
                        sshScript remote: remote, script: "startup.sh"    
                }
            }
        }
    }    
}    