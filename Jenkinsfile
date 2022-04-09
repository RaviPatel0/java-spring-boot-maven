pipeline {
    agent any

    stages {
        stage('Fetch Guthub Code') {
            steps {
                git branch: 'main', credentialsId: 'github_pass_token', url: 'https://github.com/RaviPatel0/java-spring-boot-maven.git'
            }
        }
    }
}