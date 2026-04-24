pipeline {
    agent any

    tools {
        maven 'Maven3'   // Jenkins me configure kiya hua naam
    }

    environment {
        SONAR_PROJECT_KEY = 'maven-web-app'
        SONAR_HOST_URL    = 'http://192.168.49.2:31900'
        BRANCH_ENV        = "${env.GIT_BRANCH?.replaceAll('origin/', '') ?: 'main'}"
        RECIPIENTS        = 'rkrahulsh001@gmail.com'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
                echo "Branch: ${BRANCH_ENV}"
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile -DskipTests'
            }
        }

        stage('Unit Tests') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh """
                        mvn sonar:sonar \
                            -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                            -Dsonar.projectName='Maven Web Application' \
                            -Dsonar.host.url=${SONAR_HOST_URL}
                    """
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
    }

    post {
        always {
            echo "Build: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
            echo "Status: ${currentBuild.currentResult}"
        }
        success {
            slackSend(
                channel: '#jenkins-notifications-',
                color: 'good',
                tokenCredentialId: 'slack-token',
                message: """✅ *SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}*
Job    : ${env.JOB_NAME}
Build  : #${env.BUILD_NUMBER}
Branch : ${BRANCH_ENV}
URL    : ${env.BUILD_URL}
📊 <${SONAR_HOST_URL}/dashboard?id=${SONAR_PROJECT_KEY}|SonarQube Report>"""
            )
        }
        failure {
            slackSend(
                channel: '#jenkins-notifications-',
                color: 'danger',
                tokenCredentialId: 'slack-token',
                message: """❌ *FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}*
Branch : ${BRANCH_ENV}
URL    : ${env.BUILD_URL}"""
            )
        }
    }
}
