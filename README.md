# 🚀 AWS Infrastructure Automation using Terraform

## 📌 Project Overview

This project demonstrates how to deploy a scalable and secure application infrastructure on AWS using Terraform. It includes ECS (Elastic Container Service), Application Load Balancer (ALB), RDS, CloudWatch logging, and VPC Flow Logs for monitoring.

---

## 🏗️ Architecture

```
VPC – Custom Virtual Private Cloud with public & private subnets
ECS (Fargate) – Containerized application deployment
ALB – Application Load Balancer for traffic distribution
RDS – Managed PostgreSQL database
CloudWatch – Logging and monitoring
VPC Flow Logs – Network traffic monitoring

---

## ⚙️ Technologies Used

* Terraform (Infrastructure as Code)
* AWS ECS (EC2 Launch Type)
* AWS VPC (Networking)
* AWS ALB (Load Balancing)
* AWS RDS PostgreSQL (Database)
* IAM (Roles & Policies)
* Auto Scaling Group (ASG)
* CloudWatch (Monitoring)

---

## 📂 Project Structure

```
AWS_infrastructure_automation_using_terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── ecs/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── monitoring/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
└── .gitignore
```

---

## 🌐 Infrastructure Components

### 🔹 VPC

* Custom VPC with CIDR: `10.0.0.0/16`
* Public & Private Subnets (Multi-AZ)
* Internet Gateway & NAT Gateway
* Route Tables & Associations

---

### 🔹 ECS (EC2 Launch Type)

* ECS Cluster with EC2 instances
* Auto Scaling Group (ASG)
* Launch Template
* Capacity Provider
* ECS Service & Task Definition (NGINX container)

---

### 🔹 Load Balancer (ALB)

* Deployed in public subnets
* Listener on port 80 (HTTP)
* Target group routing traffic to ECS tasks
* Health checks enabled

---

### 🔹 RDS PostgreSQL

* Engine: PostgreSQL 15
* Instance Type: `db.t3.micro`
* Multi-AZ enabled
* Private subnet deployment
* Automated backups enabled

---

###  CloudWatch Logs (ECS)
Each ECS container sends logs to CloudWatch
Helps in debugging and monitoring application behavior
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/app"
  retention_in_days = 7
}
logConfiguration = {
  logDriver = "awslogs"
  options = {
    awslogs-group         = "/ecs/app"
    awslogs-region        = "ap-south-1"
    awslogs-stream-prefix = "ecs"
  }
}

## 🔐 Security Features

* ECS instances in private subnets
* RDS not publicly accessible
* Security Groups configured:

  * ALB → Public HTTP access
  * ECS → Only ALB access
  * RDS → Only ECS access
* IAM roles with least privilege

---

## 🚀 Deployment Steps

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Plan Infrastructure

```bash
terraform plan
```

### 3️⃣ Apply Configuration

```bash
terraform apply
```

---

## 📤 Outputs

After deployment, Terraform will output:

* **ALB DNS**

```
http://my-alb-new-xxxxx.ap-south-1.elb.amazonaws.com
```

* **RDS Endpoint**

```
my-postgres-db.xxxxxx.ap-south-1.rds.amazonaws.com:5432
```

---

## 🧪 Testing

### 🌐 Test Application

Open ALB DNS in browser → Should display:

```
Welcome to NGINX
```

---

### 🗄️ Test Database

⚠️ RDS is deployed in private subnet (not publicly accessible)

Options to connect:

* Use Bastion Host (EC2)
* Connect from ECS application
* Temporarily enable public access for testing

---

## ⚠️ Common Issues & Fixes

| Issue                             | Solution                                  |
| --------------------------------- | ----------------------------------------- |
| ECS tasks not running             | Check desired_count and logs              |
| ALB shows 503                     | Check target group health                 |
| RDS not connecting                | Use Bastion or enable public access       |
| Terraform errors (already exists) | Use `terraform import` or delete manually |
| ECS cluster not deleting          | Scale ASG to 0 first                      |

---

## 🧹 Cleanup

To destroy infrastructure:

```bash
terraform destroy
```

---

## 📈 Future Improvements

* Add HTTPS (SSL via ACM)
* Use custom domain (Route53)
* CI/CD pipeline (GitHub Actions)
* Dockerized custom application
* CloudWatch logs & alarms
* Terraform remote backend (S3 + DynamoDB)

---

## 👩‍💻 Author

**Anuja Ayare**
DevOps Engineer | AWS | Terraform | Kubernetes

## 📢 Note

This project is for learning and demonstration purposes. For production, additional security and monitoring enhancements are recommended.

---
