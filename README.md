# Terraform AWS Final Project — CloudOps Dashboard

Complete AWS infrastructure provisioned with Terraform and 
Docker container deployed automatically.

## Live Deployment
![CloudOps Dashboard Live](screenshots/Screenshot_2026-04-28_094506.png)
![Terraform Apply Output](screenshots/Screenshot_2026-04-28_094453.png)

**Live URL:** http://65.0.55.87 
(stopped after testing to avoid AWS charges — 
can redeploy in under 5 minutes)

## Infrastructure Created (12 resources)
| Resource | Details |
|---|---|
| VPC | 10.0.0.0/16 — cloudops-default-vpc |
| Internet Gateway | cloudops-default-igw |
| Public Subnet | 10.0.1.0/24 — ap-south-1a |
| Route Table | Public routing to IGW |
| Security Group | HTTP 80 + SSH 22 |
| IAM Role | EC2 ECR read access |
| IAM Profile | Attached to EC2 |
| EC2 Instance | t3.micro — Amazon Linux 2023 |
| S3 Bucket | mounika-cloudops-final-2026 |
| S3 Versioning | Enabled |

## Automated Deployment Pipeline


terraform apply
↓
VPC + Subnet + IGW created
↓
Security Group + IAM Role created
↓
EC2 starts with user_data script
↓
Docker installed automatically
↓
Image pulled from Amazon ECR
↓
Container running on port 80
↓
App live at public IP


## Tech Stack
- Terraform v1.x
- AWS EC2 (t3.micro — Amazon Linux 2023)
- AWS VPC + Subnets + IGW
- AWS S3 (versioning enabled)
- AWS IAM (role-based ECR access)
- Docker + nginx:1.25-alpine
- Amazon ECR (private registry)

## Key Terraform Features Used
- Data sources (dynamic AMI selection)
- Locals (consistent tagging with merge())
- Variables + tfvars
- user_data (automated Docker deployment)
- IAM role (no hardcoded credentials)
- String interpolation
- Resource dependencies

## How to Deploy
```bash
# Prerequisites: AWS CLI configured, key pair exists

git clone https://github.com/Mounikavasireddy8/terraform-aws-final-project
cd terraform-aws-final-project

# Update terraform.tfvars with your values
terraform init
terraform plan
terraform apply -auto-approve

# Access app at the public_ip output
```

## Security Practices
- Non-root Docker user (appuser)
- IAM role instead of hardcoded credentials
- Alpine base image (23MB)
- .gitignore excludes state files and tfvars
- Security group — only ports 80 and 22 open

## Author
**Mounika Vasireddy**  
B.Tech Computer Science — 2023  
Andhra Pradesh, India  
GitHub: github.com/Mounikavasireddy8
