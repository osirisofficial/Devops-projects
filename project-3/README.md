# In This Project, we are Developing and Deploying a application on EKS using Docker and AWS Developers Tools.

due to some issue aws has stoped codecommit service, so for source code mangement we will use github

- github: For Source Code Management

- CodeBuild: For building and testing our code in a serverless fashion

- CodeDeploy: To deploy our code

- CodePipeline: To streamline the CI/CD pipeline

- System Manager: To store Parameters

- ECR: To store Docker Images in a Repository

- Identity and Access Management (IAM) for creating a Service Role

- S3 for artifact storing

- ec2 for Deployment

## **Create and setup github repo :**

- Create a repository
  ![alt text](image-3.png)

- Steup git repo localy

```
git clone https://github.com/osirisofficial/eks-app.git
```

- Copy project source-code to repo

- And to do git push
  ![alt text](image-4.png)

## **setupping ECR repository :**

- go to ECR dashboard on aws-console

- create a repository
  ![alt text](image-5.png)
  ![alt text](image-6.png)

- steps to push docker image to ECR repo
  ![alt text](image-7.png)

## **steupping up codebuild :**

- go to codebuild dashboard

- click on `create project`
  ![alt text](image-8.png)

- follow the steps
  ![alt text](image-9.png)
  ![alt text](image-14.png)
  ![alt text](image-11.png)
  ![alt text](image-12.png)
  ![alt text](image-13.png)

- CodeBuild will need buildspec.yml to build a project.

- The buildspec.yml file is in the repository root folder.

## **using system manager to store secret :**

- in app we are using TMDB API, we will store that key in system manager

  ![alt text](image-15.png)
  ![alt text](image-16.png)

- also give permission to access system manager to IAM-role assigned to codeBuild

  ![alt text](image-17.png)

- as we using ECR to store docker image , we need to provide access of ECR to IAM-role assigned to codeBuild

  ![alt text](image-18.png)

## **create and setup codeDeploy :**

- go to codedeploy dashboard

- create a application

  ![alt text](image-19.png)

- create ec2 instance , for agent of codeDeploy

  - ### **create a role for EC2 to access S3 and codeDeploy**

  - got to IAM dashboard -> create role -> service role -> EC2

  - add this permission

        1. AmazonEC2FullAccess : provide full acess to ec2
        2. AmazonEC2RoleforAWSCodeDeploy : give s3 access to ec2 which is needed agent on ec2
        3. AmazonS3FullAccess : provide full access to s3
        4. AWSCodeDeployFullAccess : provide full access to codedeploy
        5. amazonEC2containerRegistryFullaccess: beacuse we are using ECR to store docker image

    ![alt text](image-20.png)

  - create role

  - ### **create ec2 with role attached**

    ![alt text](image-21.png)
    ![alt text](image-22.png)
    ![alt text](image-23.png)

- ### **create a role for Codedeploy**

- add this permissions :

  1. awscodedeployrole

- create appsec.yaml in root directory and push it repo

  - start.sh

    ![alt text](image-28.png)

  - stop.sh

    ![alt text](image-29.png)

  - appspec.yml

    ![alt text](image-30.png)

- setup deployment group in codeDeploy application

  ![alt text](image-24.png)
  ![alt text](image-25.png)

- click on "create deploymnet"

  ![alt text](image-26.png)
  ![alt text](image-27.png)

## **create and setup codepipeline**

- go to codepipeline dashboard

- click on "create pipeline"

![alt text](image-34.png)

- follow steps
  ![alt text](image-35.png)
  ![alt text](image-36.png)
  ![alt text](image-37.png)
  ![alt text](image-38.png)

- click on create pipeline

## **Codebuild history**

![alt text](image-31.png)

## **codedeploy**

![alt text](image-32.png)

## **output**

![alt text](image-33.png)

## **Resume**

- ## DevOps Project – CI/CD Pipeline with AWS CodePipeline (Personal Project | GitHub Link)

- Provisioned AWS infrastructure (EC2, IAM Roles, Security Groups) to host application and deployment agents.

- Configured GitHub as the source code repository, enabling version control and webhook triggers for build automation.

- Designed and implemented CI/CD pipeline with AWS services:

  - CodePipeline → Orchestrated end-to-end CI/CD workflow.

  - Amazon ECR → Stored and managed versioned Docker images for deployments

  - CodeBuild → Automated build, unit testing, and artifact packaging.

  - CodeDeploy → Performed blue/green deployments across EC2 instances with zero downtime.

  - Systems Manager Parameter Store → Secured and managed sensitive credentials (API keys, passwords).

- End-to-End Automated Workflow:
  GitHub Commit → CodePipeline Trigger → CodeBuild (Compile & Test & push image to docker) → CodeDeploy (Deployment to EC2).

- Implemented monitoring and logging with AWS CloudWatch to track pipeline executions, deployment logs, and application health.

- Outcome: Delivered a containerized, secure, and fully automated CI/CD pipeline achieving faster release cycles, consistent deployments, and enhanced security through centralized secrets management.
