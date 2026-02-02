pipeline {
  agent any

  stages {
    stage('checkout'){
      steps {
                git 'https://github.com/douaatarres/user-management-app.git'
            }
    }
    stage('install dependencies'){
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Sonarqube analyse') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'npm run sonar'
                }
            }
        }


}
}
