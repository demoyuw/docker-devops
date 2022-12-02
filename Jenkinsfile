pipeline {
    agent none
    stages {
        stage('build') {
            agent { docker { image 'docker' } }
            steps {
                sh 'docker build dockerfile/flask-api --tag demoyuw/flask-api:jenkins-package'
                sh 'docker image ls'
            }
            when { branch 'master' }
        }
        stage('publish') {
            agent { docker { image 'docker' } }
            steps {
                sh 'docker login -u demoyuw -p a0918101553'
                sh 'docker push demoyuw/flask-api:jenkins-package'
            }
            when { branch 'master' }
        }
        stage('deploy') {
            agent { docker { image 'docker' } }
            steps {
                sh 'docker stop flask-api || true && docker rm flask-api || true'
                sh 'docker run -itd -p 10009:10009 --name flask-api demoyuw/flask-api:jenkins-package'
            }
            when { branch 'master' }
        }
        stage('unit-test') {
            agent { docker { image 'docker' } }
            steps {
                sh 'docker exec -i flask-api python test.py'
            }
        }
    }
}
