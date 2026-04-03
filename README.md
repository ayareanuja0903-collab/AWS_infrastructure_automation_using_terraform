# 🚀 AWS Infrastructure Automation using Terraform

## 📌 Project Overview

This project provisions a **highly available, scalable, and secure AWS infrastructure** using Terraform.

It includes:

* 🌐 VPC with public & private subnets
* 🚀 ECS Cluster (EC2 Launch Type)
* ⚖️ Application Load Balancer (ALB)
* 🗄️ RDS PostgreSQL (Multi-AZ)
* 🌍 NAT Gateway for private subnet internet access
* 🔐 Secure IAM roles & Security Groups
* 📊 Monitoring with CloudWatch

---

## 🏗️ Architecture

```
Internet → ALB → ECS (Private Subnets) → RDS (Private)
                 ↓
             NAT Gateway
```

---

## 📁 Project Structure

```
terraform-aws-ecs-infra/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── alb/
│   ├── rds/
```

---

## ⚙️ Technologies Used

* Terraform
* AWS (ECS, EC2, RDS, ALB, VPC)
* IAM & Security Groups
* CloudWatch Monitoring

---

## 🌐 Infrastructure Components

### 1. VPC & Networking

* CIDR: `10.0.0.0/16`
* Public Subnets (ALB)
* Private Subnets (ECS, RDS)
* Internet Gateway (IGW)
* NAT Gateway

---

### 2. ECS Cluster

* EC2 launch type
* Auto Scaling Group
* Runs containerized applications

---

### 3. Application Load Balancer

* Public-facing
* Routes traffic to ECS services

---

### 4. RDS PostgreSQL

* Multi-AZ deployment
* Private subnet only
* Automated backups enabled

---

## 🔐 Security Best Practices

* Least privilege IAM roles
* Private subnets for ECS & RDS
* Restricted Security Groups:

  * ALB → ECS
  * ECS → RDS
* No public DB exposure

---

## 🚀 Deployment Steps

### 1. Clone Repository

```bash
git clone https://github.com/ayareanuja0903-collab/AWS_infrastructure_automation_using_terraform.git
cd AWS_infrastructure_automation_using_terraform
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Validate Configuration

```bash
terraform validate
```

---

### 4. Plan Infrastructure

```bash
terraform plan
```

---

### 5. Apply Infrastructure

```bash
terraform apply
```

---

## 📤 Outputs

* ALB DNS URL
* RDS Endpoint

---

## 📊 Monitoring

* CloudWatch Logs
* Metrics for ECS, ALB, and RDS

---

## 👩‍💻 Author

Anuja Ayare.

Give it a ⭐ on GitHub!
