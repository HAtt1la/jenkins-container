pipeline {
    agent {
        docker {
            image 'node:10'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'ls /var/jenkins_home/workspace/test2/'
            }
        }
    }
}
