pipeline {
    agent any
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
        DOCKERHUB_CRED = credentials('dockerhub-creds')
    }
    stages {
        stage('stage 1 : git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/osirisofficial/Devops-projects.git'
            }
        }
        stage('stage 2 : mvn test') {
            steps {
                dir('project-2/full-stack-app') {
                    sh 'mvn test'
                }
            }
        }
        stage('stage 3 : trivy filesystem test') {
            steps {
                dir('project-2/full-stack-app') {
                    sh 'trivy fs . --format table -o fs.html'
                }
            }
        }
        stage('stage 4 : sonarqube analysis') {
            steps {
                dir('project-2/full-stack-app') {
                   withSonarQubeEnv('sonarqubeserver') {
                       sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Blogging-app -Dsonar.projectKey=Blogging-app \
                          -Dsonar.java.binaries=target'''
                   }
                }
            }
        }
        stage('stage 5 : build artifact') {
            steps {
                dir('project-2/full-stack-app') {
                    sh 'mvn clean package'
                }
            }
        }
        stage('stage 6 : publish artifact to nexus') {
            steps {
                dir('project-2/full-stack-app') {
                    configFileProvider([configFile(fileId: '28af0a9f-c239-47e7-a381-7c06371a6d26', variable: 'mavensettings')]){
                        sh 'mvn -s $mavensettings clean deploy'
                    }
                }
            }
        }
        stage('stage 7 : build docker image using docker file') {
            steps {
                dir('project-2/full-stack-app'){
                    sh 'docker build -t manasss0508/full-stack-blog-app-manas:latest .'
                }
            }
        }
         stage('stage 8 : Trivy image scan') {
            steps {
                echo 'tirvy image --fromat json -o result.json manasss0508/full-stack-blog-app-manas:latest'
            }
        }
        stage('stage 10 : login to docker hub') {
            steps {
                sh 'echo $DOCKERHUB_CRED_PSW | docker login -u $DOCKERHUB_CRED_USR --password-stdin'
            }
        }
        stage('stage 11 : push image to docker') {
            steps {
                sh 'docker push manasss0508/full-stack-blog-app-manas:latest'
            }
        }
        stage('stage 12 : deploy') {
            steps{
                kubeconfig(credentialsId: 'kube-creds',caCertificate:'', serverUrl: 'https://C3046497A8694552C9C6BEC2209C3836.sk1.us-east-1.eks.amazonaws.com'){
                    dir('project-2/k8s') {
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f ingress.yaml'
                    }
                }
            }
        }

    }
}
