pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'robot -d results tests/'
            }
        }
        stage('Publish Results') {
            steps {
                junit 'results/output.xml'
            }
        }
    }
}
