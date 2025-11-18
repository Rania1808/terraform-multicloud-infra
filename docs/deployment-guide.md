# Deployment Guide

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured
- Azure CLI configured
- GCP CLI configured

## Steps

### 1. Clone Repository

```bash
git clone https://github.com/Rania1808/terraform-multicloud-infra.git
cd terraform-multicloud-infra
```

### 2. Configure Variables

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan Deployment

```bash
terraform plan -out=tfplan
```

### 5. Apply Changes

```bash
terraform apply tfplan
```

## Environment-Specific Deployment

```bash
cd environments/dev
terraform init
terraform apply
```

## Troubleshooting

See [troubleshooting.md](troubleshooting.md) for common issues.
