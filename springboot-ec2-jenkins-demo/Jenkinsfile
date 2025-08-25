pipeline {
    agent any

    tools {
        jdk 'JDK17'          // Set up in Global Tool Configuration
        maven 'Maven3'       // Set up in Global Tool Configuration
    }

    environment {
        DEPLOY_USER = 'ubuntu'
        DEPLOY_HOST = '184.73.37.196'        // <- change
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
                sh 'mvn -B clean package -DskipTests'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Deploy to EC2') {
            steps {
                // Use SSH credentials stored in Jenkins (ID: ec2-ssh-key)
                sshagent(credentials: ['ec2-ssh-key']) {
                    sh """
                      ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} "mkdir -p ${DEPLOY_DIR}"
                      scp -o StrictHostKeyChecking=no target/${APP_NAME} ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_DIR}/
                      ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_HOST} << 'EOF'
                        pkill -f ${APP_NAME} || true
                        nohup java -jar ${DEPLOY_DIR}/${APP_NAME} > ${DEPLOY_DIR}/app.log 2>&1 &
                      EOF
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful! Visit: http://${DEPLOY_HOST}:8080/api/users"
        }
        failure {
            echo "❌ Deployment failed. Check Console Output and ${DEPLOY_DIR}/app.log on EC2."
        }
    }
}

