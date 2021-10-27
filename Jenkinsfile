pipeline {
    agent { docker { image 'ruby:2.5.1' } }
    stages {
        stage('requirements') {
          steps {
            sh 'gem install bundler -v 1.17.3'
            sh 'bundle install --without development'
          }
        }
        stage('build') {
            steps {
                sh 'bundle exec rails test'
            }
        }
    }
    post {
      success {
        echo 'Run second pipeline'
      }
    }
}
