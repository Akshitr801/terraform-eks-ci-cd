# Terraform + EKS + Ansible + Jenkins CI/CD Pipeline

## Project Overview

This project demonstrates a complete DevOps workflow using:

* Terraform for Infrastructure as Code (IaC)
* Amazon EKS for Kubernetes orchestration
* Ansible for configuration management
* Jenkins for CI/CD automation
* Docker for containerization
* Kubernetes for application deployment
* AWS Load Balancer for external access

The pipeline automates:

```text
GitHub → Jenkins → Docker Build → Docker Push → Kubernetes Deployment → EKS
```

---

# Architecture

## Infrastructure Components

* Custom AWS VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Amazon EKS Cluster
* EKS Managed Node Group
* Jenkins EC2 Server
* Security Groups
* IAM Roles and Policies
* AWS Load Balancer

---

# Tech Stack

| Technology           | Purpose                     |
| -------------------- | --------------------------- |
| Terraform            | Infrastructure provisioning |
| AWS EKS              | Kubernetes cluster          |
| Jenkins              | CI/CD pipeline              |
| Docker               | Containerization            |
| Ansible              | Configuration management    |
| Kubernetes           | Container orchestration     |
| AWS EC2              | Jenkins server              |
| AWS ECR / Docker Hub | Container registry          |
| GitHub               | Source code management      |

---

# Project Structure

```text
terraform-eks-ci-cd/
├── terraform/
│   ├── versions.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── jenkins.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── .gitignore
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini.example
│   └── playbooks/
│       └── configure-jenkins.yml
│
├── app/
│   ├── app.js
│   ├── package.json
│   ├── Dockerfile
│   ├── Jenkinsfile
│   ├── .dockerignore
│   └── k8s/
│       ├── deployment.yaml
│       └── service.yaml
│
└── README.md
```

---

# Infrastructure Provisioning Using Terraform

Terraform is used only for infrastructure provisioning.

## Terraform Creates

* VPC
* Public/Private Subnets
* NAT Gateway
* EKS Cluster
* EKS Managed Node Group
* Jenkins EC2 Instance
* Security Groups
* IAM Roles
* SSH Key Pair Reference

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

### Format Terraform Files

```bash
terraform fmt -recursive
```

### Validate Configuration

```bash
terraform validate
```

### Preview Infrastructure Changes

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

### Verify Outputs

```bash
terraform output
```

---

# Jenkins Server Configuration Using Ansible

Ansible is used for configuration management after infrastructure creation.

## Ansible Installs

* Jenkins
* Docker
* Java 21
* Git
* AWS CLI
* kubectl
* eksctl

## Run Ansible Playbook

```bash
cd ansible
ansible-playbook -i inventory.ini playbooks/configure-jenkins.yml
```

---

# Kubernetes Cluster Verification

## Configure kubeconfig

```bash
aws eks update-kubeconfig --region us-east-2 --name ndj-eks-cluster
```

## Verify Worker Nodes

```bash
kubectl get nodes -o wide
```

## Verify System Pods

```bash
kubectl get pods -n kube-system
```

---

# Docker Setup

## Build Docker Image

```bash
docker build -t akshitr801/nodejs-docker-jenkins-ec2-ci-cd .
```

## Run Docker Container Locally

```bash
docker run -d -p 3000:3000 --name nodejs-app akshitr801/nodejs-docker-jenkins-ec2-ci-cd
```

## Docker Login

```bash
docker login -u akshitr801
```

---

# Kubernetes Deployment

## Deploy Application

```bash
kubectl apply -f k8s/
```

## Verify Pods

```bash
kubectl get pods -o wide
```

## Verify Services

```bash
kubectl get svc
```

## Check Deployment Rollout

```bash
kubectl rollout status deployment/nodejs-app
```

---

# Jenkins Pipeline

## Jenkins Pipeline Stages

1. GitHub Source Checkout
2. Docker Image Build
3. Docker Hub Login
4. Docker Image Push
5. Kubernetes Deployment to EKS

## Jenkins Plugins Used

* Pipeline
* Git
* Docker Pipeline
* Credentials Binding
* Kubernetes CLI
* SSH Agent

---

# Jenkins Credentials

Docker Hub credentials are securely stored in Jenkins.

## Credential Configuration

| Field    | Value                   |
| -------- | ----------------------- |
| Kind     | Username with password  |
| ID       | docker-creds            |
| Username | Docker Hub Username     |
| Password | Docker Hub Access Token |

---

# Kubernetes Service Exposure

The application is exposed using:

```yaml
Type: LoadBalancer
```

AWS automatically provisions an external load balancer.

## Verify External Endpoint

```bash
kubectl get svc
```

Example:

```text
nodejs-app-service   LoadBalancer   EXTERNAL-IP
```

---

# CI/CD Workflow

```text
Developer Pushes Code → GitHub Webhook → Jenkins Pipeline Triggered
→ Docker Image Built → Image Pushed to Docker Hub
→ Kubernetes Deployment Updated → Application Available on EKS
```

---

# Features Implemented

## Infrastructure

* Modular Terraform Infrastructure
* EKS Managed Node Groups
* IAM Roles and Security Groups
* Public and Private Subnets
* NAT Gateway Networking

## Configuration Management

* Automated Jenkins Installation
* Automated Docker Installation
* Automated Kubernetes Tooling Setup

## CI/CD

* Automated Docker Build and Push
* Automated Kubernetes Deployment
* Jenkins Pipeline Automation

## Kubernetes

* Kubernetes Deployment
* Kubernetes Service
* AWS Load Balancer Integration

---

# Security Considerations

## Implemented

* Security Groups
* Private Worker Nodes
* SSH Key Authentication
* IAM Roles

## Future Improvements

* Replace AdministratorAccess with Least Privilege IAM
* Use AWS Secrets Manager
* Implement TLS/HTTPS
* Add Kubernetes Ingress
* Add WAF and Security Monitoring

---

# Challenges Faced and Troubleshooting

## EKS Worker Nodes Stuck in NotReady

Issue:

```text
NetworkPluginNotReady
cni plugin not initialized
```

Fix:

* Verified EKS addons
* Configured cluster endpoint access
* Validated VPC networking

---

## Jenkins Unable to Reach EKS API

Issue:

```text
kubectl i/o timeout
```

Fix:

* Enabled EKS public endpoint access
* Updated kubeconfig
* Validated security group rules

---

## Terraform Backend and State Issues

Issue:

```text
Backend initialization required
```

Fix:

```bash
terraform init -reconfigure
```

---

# Future Improvements

* Helm Charts
* ArgoCD GitOps
* Prometheus Monitoring
* Grafana Dashboards
* Ingress Controller
* Terraform Remote Backend
* Multi-Environment Deployments
* Blue/Green Deployment Strategy
* Autoscaling
* GitHub Webhooks
* SonarQube Integration

---

# Screenshots

## Terraform Infrastructure

* Terraform Apply Success
* Terraform State Resources

## Jenkins

* Successful Pipeline Execution
* Jenkins Dashboard

## Kubernetes

* kubectl get nodes
* kubectl get pods
* kubectl get svc

## Application

* Application Running Through AWS Load Balancer

---

# Learning Outcomes

Through this project, the following concepts were implemented and understood:

* Infrastructure as Code using Terraform
* Kubernetes Cluster Management using EKS
* Configuration Management using Ansible
* CI/CD Pipeline Automation using Jenkins
* Containerization using Docker
* Kubernetes Deployments and Services
* AWS Networking and IAM
* Troubleshooting Kubernetes Networking Issues
* End-to-End DevOps Workflow Automation

---

# Author

Akshit Rana

GitHub: [https://github.com/Akshitr801](https://github.com/Akshitr801)

---

# Final Result

Successfully built and deployed a production-style DevOps CI/CD pipeline integrating:

```text
Terraform + AWS EKS + Ansible + Jenkins + Docker + Kubernetes
```

with automated infrastructure provisioning, server configuration, container deployment, and Kubernetes orchestration on AWS.
