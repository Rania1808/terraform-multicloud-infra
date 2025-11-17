![architecture_diagram_svg](https://github.com/user-attachments/assets/7aa0010b-25af-4301-aac2-927aeeafeac0)# terraform-multicloud-infra

# 🚀 Multi-Cloud Infrastructure Provisioning with Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.6+-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Supported-FF9900?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Azure](https://img.shields.io/badge/Azure-Supported-0078D4?logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![GCP](https://img.shields.io/badge/GCP-Supported-4285F4?logo=google-cloud&logoColor=white)](https://cloud.google.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 📖 About The Project

Complete Infrastructure as Code (IaC) solution for deploying high-availability multi-cloud architecture with Terraform. This project demonstrates DevOps best practices for managing cloud resources across AWS, Azure, and GCP in a unified manner.

### ✨ Key Features

- 🌐 **Multi-Cloud**: Unified provisioning across AWS, Azure, and GCP
- 🔒 **Secure**: Secret management with Vault, private networking, encryption
- 📊 **Monitoring**: Prometheus + Grafana integration
- 🔄 **CI/CD**: Automated pipeline with GitHub Actions
- 🏗️ **Modular**: Reusable and tested Terraform modules
- 📈 **Scalable**: Auto-scaling and load balancing configured
- 🛡️ **Resilient**: Multi-region with disaster recovery

## 🏗️ Architecture


![Uploading archi<svg viewBox="0 0 1400 900" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="awsGradient" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#FF9900;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#FF6600;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="azureGradient" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#0078D4;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#005A9E;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="gcpGradient" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#4285F4;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#1A73E8;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="terraformGradient" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:#7B42BC;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#5C4EE5;stop-opacity:1" />
    </linearGradient>
    <filter id="shadow">
      <feDropShadow dx="0" dy="4" stdDeviation="4" flood-opacity="0.3"/>
    </filter>
    <filter id="glow">
      <feGaussianBlur stdDeviation="2" result="coloredBlur"/>
      <feMerge>
        <feMergeNode in="coloredBlur"/>
        <feMergeNode in="SourceGraphic"/>
      </feMerge>
    </filter>
  </defs>
  
  <!-- Background with gradient -->
  <rect width="1400" height="900" fill="#f0f4f8"/>
  <rect width="1400" height="900" fill="url(#terraformGradient)" opacity="0.03"/>
  
  <!-- Title Section -->
  <rect x="0" y="0" width="1400" height="100" fill="url(#terraformGradient)" opacity="0.95"/>
  <text x="700" y="45" font-family="Arial, sans-serif" font-size="36" font-weight="bold" text-anchor="middle" fill="white">
    Multi-Cloud Infrastructure with Terraform
  </text>
  <text x="700" y="75" font-family="Arial, sans-serif" font-size="16" text-anchor="middle" fill="white" opacity="0.9">
    Unified Infrastructure as Code Across AWS, Azure &amp; Google Cloud
  </text>
  
  <!-- Terraform Logo (Center Bottom) -->
  <g transform="translate(600, 780)" filter="url(#shadow)">
    <rect x="0" y="0" width="200" height="80" rx="15" fill="url(#terraformGradient)"/>
    <!-- Terraform T icon -->
    <g transform="translate(30, 20)">
      <polygon points="0,0 20,10 20,30 0,20" fill="white"/>
      <polygon points="25,10 45,20 45,40 25,30" fill="white"/>
      <polygon points="50,0 70,10 70,30 50,20" fill="white" opacity="0.8"/>
      <polygon points="25,35 45,45 45,65 25,55" fill="white" opacity="0.6"/>
    </g>
    <text x="110" y="50" font-family="Arial, sans-serif" font-size="24" font-weight="bold" fill="white">
      Terraform
    </text>
  </g>
  
  <!-- AWS Section -->
  <g filter="url(#shadow)">
    <!-- AWS Logo -->
    <g transform="translate(120, 140)">
      <rect x="-10" y="-10" width="80" height="80" rx="10" fill="white"/>
      <g transform="scale(0.15)">
        <path d="M150,50 L250,100 L150,150 L50,100 Z" fill="#FF9900"/>
        <path d="M150,150 L250,200 L150,250 L50,200 Z" fill="#FF9900" opacity="0.7"/>
        <rect x="100" y="60" width="100" height="15" fill="#232F3E"/>
        <text x="150" y="300" font-size="80" font-weight="bold" fill="#232F3E" text-anchor="middle">AWS</text>
      </g>
    </g>
    
    <rect x="50" y="150" width="340" height="550" rx="15" fill="white" stroke="#FF9900" stroke-width="3"/>
    <rect x="50" y="150" width="340" height="60" rx="15" fill="url(#awsGradient)"/>
    <text x="220" y="188" font-family="Arial, sans-serif" font-size="24" font-weight="bold" text-anchor="middle" fill="white">
      Amazon Web Services
    </text>
    
    <!-- AWS Components -->
    <g transform="translate(70, 230)">
      <!-- VPC -->
      <rect x="0" y="0" width="300" height="50" rx="8" fill="#FF9900" opacity="0.1" stroke="#FF9900" stroke-width="2"/>
      <text x="10" y="30" font-family="Arial, sans-serif" font-size="16" font-weight="bold" fill="#2c3e50">
        🌐 VPC - 10.0.0.0/16
      </text>
      
      <!-- EKS -->
      <rect x="0" y="70" width="300" height="70" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="10" y="95" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#2c3e50">☸️ Amazon EKS</text>
      <text x="10" y="115" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• Kubernetes v1.28</text>
      <text x="10" y="132" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• 3 t3.medium nodes</text>
      
      <!-- RDS -->
      <rect x="0" y="160" width="145" height="70" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="10" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🗄️ RDS</text>
      <text x="10" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">PostgreSQL 14</text>
      <text x="10" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Multi-AZ: ✓</text>
      
      <!-- S3 -->
      <rect x="155" y="160" width="145" height="70" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="165" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🪣 S3</text>
      <text x="165" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Object Storage</text>
      <text x="165" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Versioning: ✓</text>
      
      <!-- CloudWatch -->
      <rect x="0" y="250" width="300" height="55" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="10" y="275" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">📊 CloudWatch</text>
      <text x="10" y="295" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Logs, Metrics &amp; Alarms</text>
      
      <!-- NAT + ALB -->
      <rect x="0" y="325" width="145" height="50" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="10" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">🔀 NAT GW</text>
      <text x="10" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">3 AZs</text>
      
      <rect x="155" y="325" width="145" height="50" rx="8" fill="white" stroke="#FF9900" stroke-width="2"/>
      <text x="165" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">⚖️ ALB</text>
      <text x="165" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">Load Balancer</text>
      
      <!-- Monitoring Badge -->
      <rect x="0" y="395" width="300" height="35" rx="17.5" fill="#27ae60" opacity="0.9"/>
      <text x="150" y="418" font-family="Arial, sans-serif" font-size="13" font-weight="bold" text-anchor="middle" fill="white">
        ✓ Auto-Scaling Enabled
      </text>
    </g>
  </g>
  
  <!-- Azure Section -->
  <g filter="url(#shadow)">
    <!-- Azure Logo -->
    <g transform="translate(550, 140)">
      <rect x="-10" y="-10" width="80" height="80" rx="10" fill="white"/>
      <g transform="scale(0.15)">
        <polygon points="50,50 200,50 250,150 0,150" fill="#0078D4"/>
        <polygon points="100,150 150,250 0,250" fill="#00A4EF"/>
        <text x="125" y="320" font-size="70" font-weight="bold" fill="#0078D4" text-anchor="middle">Azure</text>
      </g>
    </g>
    
    <rect x="480" y="150" width="340" height="550" rx="15" fill="white" stroke="#0078D4" stroke-width="3"/>
    <rect x="480" y="150" width="340" height="60" rx="15" fill="url(#azureGradient)"/>
    <text x="650" y="188" font-family="Arial, sans-serif" font-size="24" font-weight="bold" text-anchor="middle" fill="white">
      Microsoft Azure
    </text>
    
    <!-- Azure Components -->
    <g transform="translate(500, 230)">
      <!-- VNet -->
      <rect x="0" y="0" width="300" height="50" rx="8" fill="#0078D4" opacity="0.1" stroke="#0078D4" stroke-width="2"/>
      <text x="10" y="30" font-family="Arial, sans-serif" font-size="16" font-weight="bold" fill="#2c3e50">
        🌐 VNet - 10.1.0.0/16
      </text>
      
      <!-- AKS -->
      <rect x="0" y="70" width="300" height="70" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="10" y="95" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#2c3e50">☸️ Azure AKS</text>
      <text x="10" y="115" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• Kubernetes v1.28</text>
      <text x="10" y="132" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• 3 Standard_B2s nodes</text>
      
      <!-- SQL Database -->
      <rect x="0" y="160" width="145" height="70" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="10" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🗄️ SQL DB</text>
      <text x="10" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">SQL Server</text>
      <text x="10" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Geo-Replica: ✓</text>
      
      <!-- Blob Storage -->
      <rect x="155" y="160" width="145" height="70" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="165" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🪣 Blob</text>
      <text x="165" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Hot/Cool Tier</text>
      <text x="165" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Encryption: ✓</text>
      
      <!-- Azure Monitor -->
      <rect x="0" y="250" width="300" height="55" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="10" y="275" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">📊 Azure Monitor</text>
      <text x="10" y="295" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Log Analytics Workspace</text>
      
      <!-- NSG + LB -->
      <rect x="0" y="325" width="145" height="50" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="10" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">🛡️ NSG</text>
      <text x="10" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">Security Rules</text>
      
      <rect x="155" y="325" width="145" height="50" rx="8" fill="white" stroke="#0078D4" stroke-width="2"/>
      <text x="165" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">⚖️ LB</text>
      <text x="165" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">Standard SKU</text>
      
      <!-- Security Badge -->
      <rect x="0" y="395" width="300" height="35" rx="17.5" fill="#e74c3c" opacity="0.9"/>
      <text x="150" y="418" font-family="Arial, sans-serif" font-size="13" font-weight="bold" text-anchor="middle" fill="white">
        🔒 TLS 1.3 Encrypted
      </text>
    </g>
  </g>
  
  <!-- GCP Section -->
  <g filter="url(#shadow)">
    <!-- GCP Logo -->
    <g transform="translate(980, 140)">
      <rect x="-10" y="-10" width="80" height="80" rx="10" fill="white"/>
      <g transform="scale(0.12)">
        <circle cx="150" cy="150" r="120" fill="#4285F4"/>
        <polygon points="150,50 220,110 220,190 150,250 80,190 80,110" fill="white"/>
        <polygon points="150,90 190,115 190,165 150,190 110,165 110,115" fill="#4285F4"/>
        <text x="150" y="340" font-size="70" font-weight="bold" fill="#4285F4" text-anchor="middle">GCP</text>
      </g>
    </g>
    
    <rect x="910" y="150" width="340" height="550" rx="15" fill="white" stroke="#4285F4" stroke-width="3"/>
    <rect x="910" y="150" width="340" height="60" rx="15" fill="url(#gcpGradient)"/>
    <text x="1080" y="188" font-family="Arial, sans-serif" font-size="24" font-weight="bold" text-anchor="middle" fill="white">
      Google Cloud Platform
    </text>
    
    <!-- GCP Components -->
    <g transform="translate(930, 230)">
      <!-- VPC -->
      <rect x="0" y="0" width="300" height="50" rx="8" fill="#4285F4" opacity="0.1" stroke="#4285F4" stroke-width="2"/>
      <text x="10" y="30" font-family="Arial, sans-serif" font-size="16" font-weight="bold" fill="#2c3e50">
        🌐 VPC - 10.2.0.0/24
      </text>
      
      <!-- GKE -->
      <rect x="0" y="70" width="300" height="70" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="10" y="95" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#2c3e50">☸️ Google GKE</text>
      <text x="10" y="115" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• Kubernetes v1.28</text>
      <text x="10" y="132" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">• 3 e2-medium nodes</text>
      
      <!-- Cloud SQL -->
      <rect x="0" y="160" width="145" height="70" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="10" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🗄️ Cloud SQL</text>
      <text x="10" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">PostgreSQL 14</text>
      <text x="10" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">HA Config: ✓</text>
      
      <!-- Cloud Storage -->
      <rect x="155" y="160" width="145" height="70" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="165" y="185" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">🪣 GCS</text>
      <text x="165" y="203" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Multi-Regional</text>
      <text x="165" y="220" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Lifecycle: ✓</text>
      
      <!-- Cloud Logging -->
      <rect x="0" y="250" width="300" height="55" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="10" y="275" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#2c3e50">📊 Cloud Logging</text>
      <text x="10" y="295" font-family="Arial, sans-serif" font-size="11" fill="#7f8c8d">Logs Explorer &amp; Metrics</text>
      
      <!-- Cloud NAT + LB -->
      <rect x="0" y="325" width="145" height="50" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="10" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">🔀 Cloud NAT</text>
      <text x="10" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">Regional</text>
      
      <rect x="155" y="325" width="145" height="50" rx="8" fill="white" stroke="#4285F4" stroke-width="2"/>
      <text x="165" y="350" font-family="Arial, sans-serif" font-size="13" font-weight="bold" fill="#2c3e50">⚖️ GLB</text>
      <text x="165" y="366" font-family="Arial, sans-serif" font-size="10" fill="#7f8c8d">Global LB</text>
      
      <!-- Compliance Badge -->
      <rect x="0" y="395" width="300" height="35" rx="17.5" fill="#9b59b6" opacity="0.9"/>
      <text x="150" y="418" font-family="Arial, sans-serif" font-size="13" font-weight="bold" text-anchor="middle" fill="white">
        ✓ GDPR Compliant
      </text>
    </g>
  </g>
  
  <!-- Connection Lines from Clouds to Terraform -->
  <line x1="220" y1="700" x2="640" y2="800" stroke="#7B42BC" stroke-width="4" stroke-dasharray="8,4" opacity="0.6"/>
  <line x1="650" y1="700" x2="680" y2="800" stroke="#7B42BC" stroke-width="4" stroke-dasharray="8,4" opacity="0.6"/>
  <line x1="1080" y1="700" x2="760" y2="800" stroke="#7B42BC" stroke-width="4" stroke-dasharray="8,4" opacity="0.6"/>
  
  <!-- Central Flow Arrows -->
  <g filter="url(#glow)">
    <path d="M 220 720 Q 220 750, 600 780" fill="none" stroke="#7B42BC" stroke-width="3" opacity="0.4"/>
    <path d="M 650 720 Q 650 750, 680 780" fill="none" stroke="#7B42BC" stroke-width="3" opacity="0.4"/>
    <path d="M 1080 720 Q 1080 750, 750 780" fill="none" stroke="#7B42BC" stroke-width="3" opacity="0.4"/>
  </g>
  
  <!-- Stats Box -->
  <g filter="url(#shadow)">
    <rect x="1100" y="750" width="250" height="120" rx="10" fill="white" stroke="#7B42BC" stroke-width="2"/>
    <text x="1225" y="775" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#2c3e50">
      📊 Infrastructure Stats
    </text>
    <text x="1115" y="800" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">
      • 9 Kubernetes Clusters
    </text>
    <text x="1115" y="820" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">
      • 3 Managed Databases
    </text>
    <text x="1115" y="840" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">
      • Multi-Region HA
    </text>
    <text x="1115" y="860" font-family="Arial, sans-serif" font-size="12" fill="#7f8c8d">
      • Auto-Scaling: Enabled
    </text>
  </g>
  
  <!-- Footer Banner -->
  <rect x="0" y="880" width="1400" height="20" fill="url(#terraformGradient)" opacity="0.8"/>
  <text x="700" y="895" font-family="Arial, sans-serif" font-size="12" font-weight="bold" text-anchor="middle" fill="white">
    Unified Multi-Cloud Management • Infrastructure as Code • DevOps Best Practices
  </text>
</svg>tecture_diagram_svg.svg…]()

```
┌─────────────────────────────────────────────────────┐
│                   Multi-Cloud Layer                  │
├──────────────┬──────────────────┬───────────────────┤
│     AWS      │      Azure       │        GCP        │
├──────────────┼──────────────────┼───────────────────┤
│ • VPC        │ • VNet           │ • VPC             │
│ • EKS        │ • AKS            │ • GKE             │
│ • RDS        │ • SQL Database   │ • Cloud SQL       │
│ • S3         │ • Blob Storage   │ • Cloud Storage   │
│ • CloudWatch │ • Monitor        │ • Cloud Logging   │
└──────────────┴──────────────────┴───────────────────┘
         │              │                │
         └──────────────┼────────────────┘
                        │
              ┌─────────▼──────────┐
              │  Terraform State   │
              │   (Remote S3 +     │
              │    DynamoDB Lock)  │
              └────────────────────┘
```

## 📁 Project Structure

```
.
├── modules/
│   ├── aws/
│   │   ├── networking/
│   │   ├── compute/
│   │   ├── database/
│   │   └── monitoring/
│   ├── azure/
│   │   ├── networking/
│   │   ├── compute/
│   │   ├── database/
│   │   └── monitoring/
│   └── gcp/
│       ├── networking/
│       ├── compute/
│       ├── database/
│       └── monitoring/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── production/
├── scripts/
│   ├── init.sh
│   ├── deploy.sh
│   └── destroy.sh
├── tests/
│   └── terraform/
├── docs/
│   ├── architecture.md
│   ├── deployment-guide.md
│   └── troubleshooting.md
├── .github/
│   └── workflows/
│       ├── terraform-plan.yml
│       └── terraform-apply.yml
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```

## 🚀 Quick Start

### Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured
- Azure CLI configured
- GCP CLI configured
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/Rania1808/terraform-multicloud-infra.git
cd terraform-multicloud-infra

# Copy and configure variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your credentials

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan -out=tfplan

# Apply changes
terraform apply tfplan
```

### Environment-specific Deployment

```bash
# Development
cd environments/dev
terraform init
terraform apply -auto-approve

# Staging
cd environments/staging
terraform apply -var-file="staging.tfvars"

# Production (with manual approval)
cd environments/production
terraform plan
terraform apply
```

## 🔧 Configuration

### Main Variables

```hcl
# AWS
aws_region          = "eu-west-1"
aws_instance_type   = "t3.medium"

# Azure
azure_location      = "West Europe"
azure_vm_size       = "Standard_B2s"

# GCP
gcp_region          = "europe-west1"
gcp_machine_type    = "e2-medium"

# Common
environment         = "production"
project_name        = "multicloud-infra"
enable_monitoring   = true
enable_backup       = true
```

### Backend Configuration

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-multicloud"
    key            = "prod/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
```

## 📊 Monitoring & Observability

- **Metrics**: Prometheus + Grafana
- **Logs**: CloudWatch, Azure Monitor, Cloud Logging
- **Alerting**: PagerDuty / Slack integration
- **Dashboards**: Pre-configured for each cloud provider

## 🧪 Testing

```bash
# Terraform validation tests
terraform fmt -check -recursive
terraform validate

# Tests with Terratest (Go)
cd tests/terraform
go test -v -timeout 30m

# Security tests with tfsec
tfsec .

# Compliance tests with Checkov
checkov -d .
```

## 🔐 Security

- ✅ Encryption in transit and at rest
- ✅ Principle of Least Privilege (IAM)
- ✅ Secrets managed with HashiCorp Vault
- ✅ Network segmentation (VPC/VNet)
- ✅ Security groups / NSGs configured
- ✅ GDPR / HIPAA compliance

## 📈 Estimated Costs

| Environment | AWS/month | Azure/month | GCP/month | Total |
|-------------|-----------|-------------|-----------|-------|
| Dev         | ~$150     | ~$120       | ~$100     | ~$370 |
| Staging     | ~$300     | ~$250       | ~$200     | ~$750 |
| Production  | ~$800     | ~$700       | ~$600     | ~$2100|

*Based on average workload*

## 🛠️ Technologies Used

- **IaC**: Terraform, Terragrunt
- **Cloud**: AWS, Azure, GCP
- **CI/CD**: GitHub Actions
- **Monitoring**: Prometheus, Grafana, ELK Stack
- **Security**: Vault, tfsec, Checkov
- **Testing**: Terratest, Kitchen-Terraform

## 📚 Documentation

- [Detailed Architecture Guide](docs/architecture.md)
- [Deployment Guide](docs/deployment-guide.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Security & Compliance](docs/security.md)

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the project
2. Create a branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Roadmap

- [ ] Multi-cluster Kubernetes support
- [ ] Ansible integration for configuration
- [ ] Service Mesh (Istio)
- [ ] GitOps with ArgoCD
- [ ] Automated Disaster Recovery
- [ ] Cost optimization with Infracost

## 👤 Author

**Contact**
- LinkedIn: [rania-brahmi](https://linkedin.com/in/rania-brahmi)
- GitHub: [@Rania1808](https://github.com/Rania1808)

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Terraform Community
- AWS, Azure, GCP Documentation
- Open-source contributors

---

⭐ If this project helped you, please give it a star!


**#DevOps #Terraform #MultiCloud #IaC #AWS #Azure #GCP #CloudComputing**
