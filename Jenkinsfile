pipeline {
    agent any

    tools {
        jdk 'JDK17'        // Global Tool Configuration
        maven 'Maven3'     // Global Tool Configuration
    }

    environment {
        DEPLOY_USER = 'ubuntu'
        DEPLOY_HOST = '184.73.37.196'       // Change to your EC2 IP
        DEPLOY_DIR  = '/home/ubuntu/app'
        APP_NAME    = 'springboot-ec2-jenkins-demo-1.0.0.jar'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'mvn -B clean package -DskipTests'

                    // Check if JAR exists
                    def jarExists = fileExists("target/${APP_NAME}")
                    if (!jarExists) {
                        error "Build failed: ${APP_NAME} not found!"
                    }

                    archiveArtifacts artifacts: "target/${APP_NAME}", fingerprint: true
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: ['ec2-ssh-key']) {
                    script {
                        sh """
                        ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} "
                            mkdir -p ${DEPLOY_DIR} &&
                            pkill -f ${APP_NAME} || true
                        "
                        scp -o StrictHostKeyChecking=no target/${APP_NAME} ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_DIR}/
                        ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} "
                            nohup java -jar ${DEPLOY_DIR}/${APP_NAME} > ${DEPLOY_DIR}/app.log 2>&1 &
                        "
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed. Check logs in Jenkins workspace or EC2 at ${DEPLOY_DIR}/app.log"
        }
    }
}

