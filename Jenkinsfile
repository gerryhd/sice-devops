pipeline {
    agent { dockerfile true }
    stages {
        stage('test') {
          environment {
            RAILS_ENV = 'test'
          }
          steps {
            sh 'bundle exec rails db:migrate'
            sh 'bundle exec rake test'
          }
        }

        stage('build') {
            steps {
              sh "docker build -t sice-${GIT_BRANCH}:${BUILD_NUMBER}"
              sh "docker run sice-${GIT_BRANCH}:${BUILD_NUMBER} bundle exec rails db:migrate"
              sh "docker run sice-${GIT_BRANCH}:${BUILD_NUMBER} bundle exec rails s"
            }
        }
    }
    post {
      success {
        echo 'Run second pipeline'
      }
    }
}
