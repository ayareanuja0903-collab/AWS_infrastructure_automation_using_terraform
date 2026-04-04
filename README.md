# 🚀 AWS Infrastructure Automation using Terraform

## 📌 Project Overview

This project demonstrates how to provision and manage a scalable, secure AWS infrastructure using Terraform. It includes VPC, ECS, RDS, and monitoring with CloudWatch and VPC Flow Logs.

---

## 🏗️ Architecture Components

* **VPC** – Custom Virtual Private Cloud with public and private subnets
* **ECS (Fargate)** – Containerized application deployment
* **RDS** – Managed PostgreSQL database
* **CloudWatch** – Application logging and monitoring
* **VPC Flow Logs** – Network-level traffic monitoring

---

## 📁 Project Structure

```
AWS_infrastructure_automation_using_terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── rds/
│   └── monitoring/
│
└── .gitignore
```

---

## ⚙️ Prerequisites

* AWS Account
* Terraform installed
* AWS CLI configured (`aws configure`)
* IAM user with required permissions

---

## 🚀 Deployment Steps

```bash
terraform init
terraform plan
terraform apply
```

---

## 🔐 Security Best Practices

* Use **least privilege IAM roles**
* Restrict traffic using **Security Groups**
* Enable **encryption at rest and in transit**
* Store secrets using **AWS Secrets Manager / SSM Parameter Store**

---

## 📊 Monitoring & Logging

### ✅ CloudWatch Logs (ECS)

* Captures application logs from ECS containers
* Useful for debugging and performance monitoring

```hcl
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/app"
  retention_in_days = 7
}
```

---

### 🌐 VPC Flow Logs

* Captures all network traffic within the VPC
* Helps in security analysis and troubleshooting

```hcl
resource "aws_flow_log" "vpc_flow" {
  log_destination      = aws_cloudwatch_log_group.vpc_logs.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type         = "ALL"
  vpc_id               = module.vpc.vpc_id
}
```

---

## ⚡ Scalability Features

* ECS auto scaling
* Multi-AZ deployment
* Highly available infrastructure

---

## 🧨 Destroy Infrastructure

### 🔥 Delete all resources

```bash
terraform destroy
```

### 🔍 Preview before deletion

```bash
terraform plan -destroy
```

---

## 🌐 VPC Note

* A VPC cannot be "stopped" like an EC2 instance
* To reduce cost:

  * Stop EC2 instances
  * Scale ECS services to zero
  * Remove NAT Gateways
* To completely remove VPC → use `terraform destroy`
  
---

## 📌 Outputs

* VPC ID
* ECS Service Name
* RDS Endpoint

---

## 🎯 Conclusion

This project follows modern DevOps practices including Infrastructure as Code, modular design, security, and observability using AWS and Terraform.

---

## 🙌 Author
https://github.com/ayareanuja0903-collab?tab=repositories

If you like this project, give it a ⭐ on GitHub!
