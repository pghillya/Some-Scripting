pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                // Here we'll make sure we aren't accumulating images
                sh 'docker rm stonks || true && docker rmi stonks || true'

                // Build Docker image
                echo 'building python code'
                sh 'docker build -t stonks .'
            }
        }
        stage('run') {
            steps {
                /* Minimal for now-- just run the container, check the logs*/

                echo 'running the container'
                sh 'docker run --name stonks stonks'

                // Check Exit Code
                sh 'docker inspect stonks --format=\'{{.State.ExitCode}}\''
            }
        }
    }
}