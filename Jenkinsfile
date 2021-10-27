pipeline {
    agent { dockerfile true }
    stages {
        stage('start') {
          steps {
            sh 'bundle exec rails db:create'
            sh 'bundle exec rails db:migrate'
            sh 'bundle exec rails s'
          }
        }
    }
}
