pipeline {
    agent { label 'master' }
    stages {
        stage('build') {
            steps {
                echo 'building python code'
                sh 'docker build -t stonks .'
            }
        }
        stage('run') {
            steps {
                echo 'running the container'
                sh 'docker run stonks'
            }
        }
    }
}
