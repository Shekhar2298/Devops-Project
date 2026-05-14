pipeline {
    agent any

    stages {

        stage('Deploy Through Ansible Server') {

            steps {

                sh """
                ssh ec2-user@32.198.45.184 '
                cd ~/Devops-Project &&

                git pull origin main &&

                docker build -t shekhar2298/devops-static-site:latest . &&

                docker push shekhar2298/devops-static-site:latest &&

                ansible-playbook -i inventory deploy.yml
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
