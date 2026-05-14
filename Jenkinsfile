pipeline {
    agent any

    stages {

        stage('Trigger Deployment') {

            steps {

                sh """
                ssh ec2-user@32.198.45.184 '
                cd ~/devops-project &&
                ./deploy.sh
                '
                """
            }
        }
    }

    post {

        success {
            echo 'Deployment Successful!'
        }

        failure {
            echo 'Deployment Failed!'
        }
    }
}
