In This Project, we are Developing and Deploying a application on EKS using Docker and AWS Developers Tools.
due to some issue aws has stoped codecommit service, so for source code mangement we will use github

- github: For Source Code Management

- CodeBuild: For building and testing our code in a serverless fashion

- CodeDeploy: To deploy our code

- CodePipeline: To streamline the CI/CD pipeline

- System Manager: To store Parameters

- ECR: To store Docker Images in a Repository

- Identity and Access Management (IAM) for creating a Service Role

- S3 for artifact storing

- EKS for Deployment

Create and setup github repo :

- Create a repository
  ![alt text](image-3.png)

- Steup git repo localy

```
git clone https://github.com/osirisofficial/eks-app.git
```

- Copy project source-code to repo

- And to do git push
  ![alt text](image-4.png)

setupping ECR repository :

- go to ECR dashboard on aws-console

- create a repository
  ![alt text](image-5.png)
  ![alt text](image-6.png)

- steps to push docker image to ECR repo
  ![alt text](image-7.png)

steupping up codebuild :

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
