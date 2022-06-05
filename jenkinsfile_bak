pipeline {
    agent none
    stages {
        stage('code-scan') {
            agent { docker { image 'docker' } }
            steps {
                sh 'echo "sonar.projectKey=root_docker-devops_AXy8o5NF5HGbdnkE_LVJ" > sonar-project.properties'
                sh 'cat sonar-project.properties'
                sh 'docker run --rm -e SONAR_HOST_URL="http://34.135.78.3:9000" -e SONAR_LOGIN="a83bc81c5d0686228ec5fb91d4b31e3953926379" -v "/home/demoyuw/jenkins-data/workspace/docker-devops_master:/usr/src/" sonarsource/sonar-scanner-cli'
            }
            when { branch 'master' }
        }
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
