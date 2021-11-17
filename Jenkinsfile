pipeline {
    agent any
    stages {
        stage('requirements') {
          agent { docker { image 'ruby:2.5.1' } }
          steps {
            sh 'gem install bundler -v 1.17.3'
            sh 'bundle install'
            sh 'bundle exec rails db:migrate'
            sh 'bundle exec rake test'
          }
        }

        stage('build') {
            steps {
              sh "docker kill ${docker ps -q}"
              sh "docker build -t sice-${GIT_BRANCH}:${BUILD_NUMBER} ."
              sh "docker run -d -p 3000:3000 sice-${GIT_BRANCH}:${BUILD_NUMBER}"
            }
        }
    }
    post {
      success {
        echo 'Run second pipeline'
        build job: 'ReactPipeline', propagate: true, wait: true
      }
    }
}
