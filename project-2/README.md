🚀 DevOps Project: CI/CD on AWS with Monitoring

This project demonstrates a complete DevOps lifecycle implementation on AWS — from infrastructure provisioning to CI/CD pipelines and monitoring with observability.

📌 Project Overview

- Provisioned AWS infrastructure using Terraform.

- Configured CI/CD pipeline with Jenkins.

- Integrated SonarQube, Nexus, DockerHub, and Trivy into pipeline.

- Deployed application to Kubernetes (EKS) with Ingress controller.

- Set up Prometheus + Grafana + Blackbox Exporter for monitoring.

⚡ Infrastructure (Terraform)

- VPC creation with networking resources.

- 4 EC2 instances:

  - Jenkins EC2

  - Monitoring EC2 (Prometheus, Grafana, Blackbox)

  - SonarQube + Nexus EC2

  - Ansible EC2 (with EKS access)

- EKS Cluster + RBAC configuration for Jenkins.

🔧 Configuration (Ansible)

- Installed Jenkins, Docker, Trivy, Maven.

- Deployed containerized SonarQube & Nexus.

- Managed dependencies and Docker installation across nodes.

🛠️ CI/CD Pipeline (Jenkins)

Pipeline Stages:

- Git Checkout (from GitHub)

- Build & Unit Test → mvn test

- Security Scan (FS) → trivy fs

- Code Quality → SonarQube analysis

- Package → mvn package

- Build Docker Image → Dockerfile

- Security Scan (Image) → trivy image

- Push Image → DockerHub

- Deploy to Kubernetes (EKS) → Deployment + Ingress

📊 Monitoring & Observability

- Blackbox Exporter → Probes application endpoints.

- Prometheus → Scrapes metrics from Blackbox + EKS.

- Grafana → Visualizes metrics in real-time dashboards.

🛠️ Tech Stack

- IAC → Terraform

- Configuration → Ansible

- CI/CD → Jenkins

- Artifact Management → Nexus

- Code Quality → SonarQube

- Containerization → Docker

- Registry → DockerHub

- Orchestration → Kubernetes (EKS)

- Security → Trivy

- Monitoring → Prometheus, Grafana, Blackbox Exporter

- Version Control → GitHub

🚀 Workflow Summary

- Developer commits code → GitHub.

- Jenkins pipeline runs → build, test, scan, package.

- Artifacts pushed → Nexus, DockerHub.

- Docker image deployed → Kubernetes (EKS).

- Monitoring → Prometheus + Grafana dashboards.

📸 Demo Screenshots

- ✅ Jenkins Pipeline Execution

- ✅ SonarQube Analysis Report

- ✅ Nexus Repository Artifact

- ✅ app running

- ✅ Grafana Dashboard
