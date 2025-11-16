pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-k8s-app .'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/'
            }
        }
        stage('Verify Deployment') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get services'
            }
        }
    }
}
