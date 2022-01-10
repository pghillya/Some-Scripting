pipeline {
    agent any
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

                /* Check Exit Code
                Based on Exit Code, determine whether to send new image to docker hub or not
                Docker hub stuff comes later */

                script {
                    EXIT_CODE = sh (
                        script: 'docker inspect stonks --format=\'{{.State.ExitCode}}\'',
                        returnStdout: true
                    ).trim()
                    echo "${EXIT_CODE}"
                    if (EXIT_CODE=='0') {
                        echo "The build was successful"
                        } else {
                            echo "The build was unsuccessful"
                        }
                    
                }

                /* sh 'exit=$(docker inspect stonks --format=\'{{.State.ExitCode}}\') && \
                if [[ $exit = 0 ]]; then  echo "Build succeeded"; else  \
                echo "build failed! Image not pushed to hub"; fi' */
            }
        }
    }
}