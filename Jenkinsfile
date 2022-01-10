pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'building python code'
                buildah bud -t stonks .
            }
        }
        stage('run') {
            steps {
                echo 'running the container'
                podman run --name stonks stonks
            }
        }
    }
}
