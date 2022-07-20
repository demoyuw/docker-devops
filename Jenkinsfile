pipeline {
  agent {
    kubernetes {
      yamlFile 'jenkins/docker-pod.yaml'
    }
  }
  stages {
    stage('unittest') {
      agent { kubernetes { yamlFile 'jenkins/python-pod.yaml' }}
      steps {
        container('flask') {
          sh 'python dockerfile/flask-api/test.py'
        }
      }
    }
    stage('build') {
      steps {
        container('docker') {
          sh 'docker build dockerfile/flask-api --tag demoyuw/flask-api:${BRANCH_NAME}'
          sh 'docker image ls'
          sh 'docker login -u demoyuw -p a0918101553'
          sh 'docker push demoyuw/flask-api:${BRANCH_NAME}'
        }
      }
    }

  }
}
