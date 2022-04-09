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
                        remote.user = 'ubuntu'
                        remote.identityFile = "/var/lib/jenkins/.ssh/id_rsa.pem"
                        remote.allowAnyHosts = true
                        sshCommand remote: remote, command: "docker-compose down -d"
                        sshCommand remote: remote, command: "docker rmi -f java_app:1.1"
                        sshPut remote: remote, from: './docker-compose.yml', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './pom.xml', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './src', into: '/home/ubuntu/java-maven-app'
                        sshPut remote: remote, from: './Dockerfile', into: '/home/ubuntu/java-maven-app'
                        sshCommand remote: remote, command: "docker build . -t java_app:1.1"
                        sshCommand remote: remote, command: "docker-compose up -d"
                        sshCommand remote: remote, command: "docker ps"
                }
            }
        }
    }    
}    