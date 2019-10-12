pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh 'echo "nginx"'
        sh 'echo "123"'
      }
    }
    stage('test2') {
      steps {
        sh 'echo "mmmmmmmmmm"'
        sh '''git clone https://github.com/xinshouXY/job-name.git
mv job-name /mnt'''
      }
    }
  }
}