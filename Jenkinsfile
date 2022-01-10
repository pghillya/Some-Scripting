pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'building python code'
                sh 'buildah bud --format docker -f Dockerfile -t stonks .'
            }
        }
        stage('run') {
            steps {
                echo 'running the container'
                sh 'podman run --name stonks stonks'
            }
        }
    }
}