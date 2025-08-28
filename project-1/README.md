Deploying EKS Clusters and Applications with CI/CD using Jenkins and Terraform

Major steps :
I. Setting up Jenkins Server with Terraform

            - Creating an EC2 instance with Terraform.

            - Installing necessary tools: Java, Jenkins, AWS CLI, Terraform CLI, Docker, Sonar, Helm, Trivy, Kubectl.

            - Configuring Jenkins server.

II. Creating EKS Cluster with Terraform

            - Writing Terraform configuration files for EKS cluster creation in a private subnet.

            - Deploying EKS cluster using Terraform.

III. Deploying NGinx Application with Kubernetes

            - Writing Kubernetes manifest files (YAML) for the NGinx application.

            - Deploying NGinx application to EKS cluster.

IV. Automating Deployment with Jenkins CI/CD

            - Creating Jenkins pipeline for automating EKS cluster creation and Nginx application deployment.

            - Integrating Terraform and Kubernetes with the Jenkins pipeline.

            - Configuring continuous integration and deployment (CI/CD).

if you have to deploy project perform this steps :

            - stage 1 : deploy vpc "infrastructure/vpc/"

            - stage 2 : deploy Jenkins ec2 server " infrastructure/jenkins-ec2/"

            - stage 3 : login Jenkins-ec2 server

            - stage 4 : check all tools we installed on jenkins-ec2 server

            - stage 5 : configure Jenkins over browser using public_ip of jenkins-ec2:8080

            - stage 6 : install aws credential and aws steps plugin in jenkins

            - stage 7 : configure aws credentials in Jenkins

            - stage 8 : deploy CI/CD pipeline on Jenkins (eks will be deployed using this pipeline)

if you want check all steps in detailed how i made this project you can see project-1.pdf in same folder
