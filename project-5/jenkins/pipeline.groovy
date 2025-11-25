pipeline {
    agent any
    
    environment{
        SCANNER_HOME_DIR = tool 'sonar_scanner'
        DOCKERHUB_CREDS = credentials('docker_creds')
    }

    stages {
        stage('stage 1 : git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/osirisofficial/Devops-projects.git'
            }
        }
        stage('stage 2 : mvn test') {
            steps {
                dir('project-5/project-sourcecode'){
                    sh'mvn test'
                }
            }
        }
        stage('stage 3 : file system check') {
            steps {
                dir('project-5/project-sourcecode'){
                    sh'trivy fs -f json -o result.json .'
                }
            }
        }
        stage('stage 4 : sonarqube analysis'){
            steps {
                dir('project-5/project-sourcecode'){
                    withSonarQubeEnv('sonar_server') {
                        sh '''$SCANNER_HOME_DIR/bin/sonar-scanner -Dsonar.projectName=agroapp -Dsonar.projectKey=agroapp -Dsonar.java.binaries=target'''
                    }
                }
            }
        }
        stage('stage 5 : qualitygate checks') {
            steps {
                sh'echo "hello world" '
            }
        }
        stage('stage 6 : mvn build'){
            steps {
                dir('project-5/project-sourcecode'){
                   sh'mvn clean package -Dmaven.test.skip=true'
                }
            }
        }
        stage('stage 7 : nexus repo deploy'){
            steps {
                dir('project-5/project-sourcecode'){
                   configFileProvider([configFile(fileId: '30ab94ae-160f-4f6a-a680-450ce7547655', variable: 'mavensettings')]){
                        sh 'mvn -s $mavensettings clean deploy'
                    }
                }
            }
        }
        stage('stage 8 : docker image build'){
            steps {
                dir('project-5/project-sourcecode'){
                    sh'docker build -t manasss0508/medicure:latest .'
                }
            }
        }
        stage('stage 9 :  image scan'){
            steps {
                dir('project-5/project-sourcecode'){
                   sh'trivy image -f json -o image-scan.json manasss0508/medicure:latest'
                }
            }
        }
        stage('stage 10 : docker login & push'){
            steps {
                dir('project-5/project-sourcecode'){
                    sh 'echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin'
                    sh 'docker push manasss0508/medicure:latest'
                }
            }
            post {
                success {
                    mail bcc: 'kondamanas.official@gmail.com', body: 'docker image build is done, you can procced with agrocd deployment', cc: 'kondamanas.official@gmail.com', from: '', replyTo: '', subject: 'docker image build is done', to: 'kondamanas.official@gmail.com'
                }
            }
        }
    }
}
