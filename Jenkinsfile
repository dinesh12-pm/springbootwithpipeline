pipeline {
    agent any

    environment {
        DEPLOY_USER = 'ubuntu'
        DEPLOY_HOST = '184.73.37.196'  // your EC2 IP
        DEPLOY_DIR = '/home/ubuntu/app'
        APP_NAME = 'springboot-ec2-jenkins-demo-1.0.0.jar'
        PORT = '8080'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the Spring Boot application...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: ['ec2-ssh-key']) {
                    script {
                        sh """
                        echo 'Stopping existing app if running...'
                        ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} '
                            mkdir -p ${DEPLOY_DIR} &&
                            fuser -k ${PORT}/tcp || true
                        '

                        echo 'Backing up old JAR...'
                        ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} '''
                            if [ -f ${DEPLOY_DIR}/${APP_NAME} ]; then
                                mv ${DEPLOY_DIR}/${APP_NAME} ${DEPLOY_DIR}/old-$(date +%s).jar
                            fi
                        '''

                        echo 'Copying new JAR to EC2...'
                        scp -o StrictHostKeyChecking=no target/${APP_NAME} ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_DIR}/

                        echo 'Starting new application...'
                        ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} '''
                            nohup java -jar ${DEPLOY_DIR}/${APP_NAME} > ${DEPLOY_DIR}/app.log 2>&1 &
                        '''
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment succeeded!'
        }
        failure {
            echo '❌ Deployment failed. Check Jenkins workspace or EC2 logs at ${DEPLOY_DIR}/app.log'
        }
    }
}

