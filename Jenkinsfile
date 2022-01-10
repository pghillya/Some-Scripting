pipeline {
    agent any
    environment {
        DOCKER_USER="pghillya"
        DOCKER_PASS=credentials('docker_hub_pass')
    }
    
    stages {
        stage('build') {
            steps {
                // Here we'll make sure we aren't accumulating images
                //sh 'docker rm stonks || true && docker rmi stonks || true'

                // Build Docker image
                echo 'building docker image'
                //sh 'docker build -t stonks .'
            }
        }
        stage('run') {
            steps {
                /* Minimal for now-- just run the container, check the logs*/

                echo 'running the container'
                //sh 'docker run --name stonks stonks'

                /* Based on Exit Code, determine whether to send new image to docker hub or not
                Docker hub stuff comes later */

                script {
                    EXIT_CODE = sh (
                        script: 'docker inspect stonks --format=\'{{.State.ExitCode}}\'',
                        returnStdout: true
                    ).trim()

                    if ( EXIT_CODE == '0' ) {
                        echo "The build was successful with exit code ${EXIT_CODE}"
                        /* use shell script to send docker image to docker hub-- need to
                        configure local environment variables for Jenkins*/
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                        sh "docker push pghillya/stonks:latest"
                        } else {
                            echo "The build was unsuccessful with exit code ${EXIT_CODE}"
                        }
                }
            }
        }
    }
}