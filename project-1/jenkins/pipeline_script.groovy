pipeline {
    agent any

    stages {
        stage('stage 1 : scm checkout'){
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/osirisofficial/Devops-projects.git'
                }
            }
        }
        stage('stage 2 : terraform initilization'){
            steps {
                dir('project-1/infrastructure/eks') {
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script {
                            sh 'terraform init'
                        }
                    }
                }
            }
        }
        stage('stage 3 : terraform validate'){
            steps {
                dir('project-1/infrastructure/eks') {
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script {
                            sh 'terraform validate'
                        }
                    }
                }
            }
        }
        stage('stage 4 : terraform plan'){
            steps {
                dir('project-1/infrastructure/eks'){
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script {
                            sh 'terraform plan'
                        }
                    }
                }
            }
        }
        stage('stage 5 : terraform apply'){
            steps {
                dir('project-1/infrastructure/eks'){
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script {
                            sh 'terraform $action --auto-approve'
                        }
                    }
                    
                }
            }
        }
        stage('stage 6 : configure eks-cluster on aws'){
            steps {
                dir('project-1/infrastructure/eks'){
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script{
                            sh 'aws eks update-kubeconfig --name my-eks-cluster --region us-east-1'
                            sh 'kubectl get pods --all-namespaces'
                        }
                    }
                }
            }
        }
        stage('stage 7 : install nginx-ingress controller on eks'){
            steps {
                dir('project-1/infrastructure/eks'){
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script{
                            sh 'kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml'
                            sh 'kubectl get pods -n ingress-nginx'
                        }
                    }
                }
            }
        }
        stage('stage 8 : creating resources in k8s'){
            steps {
                dir("project-1/k8s"){
                    withAWS(credentials: 'aws-creds', region: 'us-east-1'){
                        script {
                            sh 'kubectl $kube -f deployment.yaml'
                            sh 'kubectl get pods'
                            sh 'kubectl $kube -f clusterip-service.yaml'
                            sh 'kubectl get svc'
                            sh 'kubectl $kube -f ingress.yaml'
                            sh 'kubectl get ingress'
                        }
                    }
                }
                
            }
        }
    }
}

