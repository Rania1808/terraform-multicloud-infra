

#!/bin/bash

# Multi-Cloud Terraform Infrastructure - Quick Setup Script
# This script creates the complete directory structure and placeholder files

set -e

echo "🚀 Setting up Multi-Cloud Terraform Infrastructure..."
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo -e "${GREEN}✓${NC} Created directory: $1"
    else
        echo -e "${YELLOW}→${NC} Directory exists: $1"
    fi
}

# Function to create placeholder file
create_placeholder() {
    if [ ! -f "$1" ]; then
        cat > "$1" << EOF
# $2
# TODO: Implement this module

# This is a placeholder file. Replace with actual implementation.
EOF
        echo -e "${GREEN}✓${NC} Created placeholder: $1"
    fi
}

echo -e "${BLUE}📁 Creating directory structure...${NC}"
echo ""

# Root level directories
create_dir "modules/aws/networking"
create_dir "modules/aws/compute"
create_dir "modules/aws/database"
create_dir "modules/aws/monitoring"

create_dir "modules/azure/networking"
create_dir "modules/azure/compute"
create_dir "modules/azure/database"
create_dir "modules/azure/monitoring"

create_dir "modules/gcp/networking"
create_dir "modules/gcp/compute"
create_dir "modules/gcp/database"
create_dir "modules/gcp/monitoring"

create_dir "modules/monitoring/centralized"

create_dir "environments/dev"
create_dir "environments/staging"
create_dir "environments/production"

create_dir "scripts"
create_dir "tests/terraform"
create_dir "docs"
create_dir ".github/workflows"
create_dir "diagrams"

echo ""
echo -e "${BLUE}📝 Creating placeholder files for modules...${NC}"
echo ""

# AWS Module Placeholders
for module in compute database monitoring; do
    create_placeholder "modules/aws/${module}/main.tf" "AWS ${module^} Module"
    create_placeholder "modules/aws/${module}/variables.tf" "AWS ${module^} Variables"
    create_placeholder "modules/aws/${module}/outputs.tf" "AWS ${module^} Outputs"
done

# Azure Module Placeholders
for module in networking compute database monitoring; do
    create_placeholder "modules/azure/${module}/main.tf" "Azure ${module^} Module"
    create_placeholder "modules/azure/${module}/variables.tf" "Azure ${module^} Variables"
    create_placeholder "modules/azure/${module}/outputs.tf" "Azure ${module^} Outputs"
done

# GCP Module Placeholders
for module in networking compute database monitoring; do
    create_placeholder "modules/gcp/${module}/main.tf" "GCP ${module^} Module"
    create_placeholder "modules/gcp/${module}/variables.tf" "GCP ${module^} Variables"
    create_placeholder "modules/gcp/${module}/outputs.tf" "GCP ${module^} Outputs"
done

# Centralized Monitoring
create_placeholder "modules/monitoring/centralized/main.tf" "Centralized Monitoring"
create_placeholder "modules/monitoring/centralized/variables.tf" "Monitoring Variables"
create_placeholder "modules/monitoring/centralized/outputs.tf" "Monitoring Outputs"

echo ""
echo -e "${BLUE}🔧 Creating utility scripts...${NC}"
echo ""

# Init script
cat > scripts/init.sh << 'EOF'
#!/bin/bash
# Initialize Terraform for all environments

echo "Initializing Terraform..."

for env in dev staging production; do
    echo "→ Initializing $env environment..."
    cd "environments/$env" || exit
    terraform init
    cd ../.. || exit
done

echo "✓ All environments initialized!"
EOF

chmod +x scripts/init.sh
echo -e "${GREEN}✓${NC} Created scripts/init.sh"

# Deploy script
cat > scripts/deploy.sh << 'EOF'
#!/bin/bash
# Deploy infrastructure to specified environment

ENV=${1:-dev}

if [ ! -d "environments/$ENV" ]; then
    echo "Error: Environment $ENV does not exist"
    exit 1
fi

echo "Deploying to $ENV environment..."

cd "environments/$ENV" || exit
terraform plan -out=tfplan
terraform apply tfplan

echo "✓ Deployment complete!"
EOF

chmod +x scripts/deploy.sh
echo -e "${GREEN}✓${NC} Created scripts/deploy.sh"

# Destroy script
cat > scripts/destroy.sh << 'EOF'
#!/bin/bash
# Destroy infrastructure in specified environment

ENV=${1:-dev}

if [ ! -d "environments/$ENV" ]; then
    echo "Error: Environment $ENV does not exist"
    exit 1
fi

echo "⚠️  WARNING: This will destroy all resources in $ENV!"
read -p "Are you sure? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cancelled."
    exit 0
fi

cd "environments/$ENV" || exit
terraform destroy

echo "✓ Resources destroyed!"
EOF

chmod +x scripts/destroy.sh
echo -e "${GREEN}✓${NC} Created scripts/destroy.sh"

echo ""
echo -e "${BLUE}📚 Creating documentation...${NC}"
echo ""

# Create CHANGELOG.md
cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-11-17

### Added
- Initial release
- Multi-cloud support (AWS, Azure, GCP)
- Kubernetes cluster provisioning
- Database setup
- Monitoring stack
- CI/CD pipeline with GitHub Actions
- Complete documentation
EOF

echo -e "${GREEN}✓${NC} Created CHANGELOG.md"

# Create CONTRIBUTING.md
cat > CONTRIBUTING.md << 'EOF'
# Contributing to Multi-Cloud Terraform Infrastructure

Thank you for your interest in contributing!

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Development Setup

1. Install Terraform >= 1.6.0
2. Configure cloud provider credentials
3. Run `terraform init`
4. Make your changes
5. Run `terraform validate` and `terraform fmt`

## Code Standards

- Follow Terraform best practices
- Add comments for complex logic
- Update documentation for new features
- Add tests when applicable

## Pull Request Process

1. Update the README.md with details of changes
2. Update the CHANGELOG.md
3. The PR will be merged once approved by maintainers
EOF

echo -e "${GREEN}✓${NC} Created CONTRIBUTING.md"

# Create deployment guide
cat > docs/deployment-guide.md << 'EOF'
# Deployment Guide

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured
- Azure CLI configured
- GCP CLI configured

## Steps

### 1. Clone Repository

```bash
git clone https://github.com/YOUR-USERNAME/terraform-multicloud-infra.git
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
EOF

echo -e "${GREEN}✓${NC} Created docs/deployment-guide.md"

# Create troubleshooting guide
cat > docs/troubleshooting.md << 'EOF'
# Troubleshooting Guide

## Common Issues

### Issue: Terraform state lock

**Solution:**
```bash
terraform force-unlock LOCK_ID
```

### Issue: Provider authentication failed

**Solution:**
- Verify credentials are configured
- Check IAM permissions
- Ensure regions are correct

### Issue: Module not found

**Solution:**
```bash
terraform init -upgrade
```

## Getting Help

1. Check GitHub Issues
2. Review Terraform documentation
3. Open a new issue with details
EOF

echo -e "${GREEN}✓${NC} Created docs/troubleshooting.md"

# Create security documentation
cat > docs/security.md << 'EOF'
# Security Guide

## Best Practices

### 1. Secrets Management
- Never commit secrets to Git
- Use environment variables
- Consider HashiCorp Vault

### 2. Network Security
- Use private subnets for sensitive resources
- Implement security groups/NSGs
- Enable VPC flow logs

### 3. IAM
- Follow principle of least privilege
- Use service accounts
- Rotate credentials regularly

### 4. Encryption
- Enable encryption at rest
- Use TLS for data in transit
- Manage keys properly

## Compliance

This infrastructure can be configured to meet:
- GDPR requirements
- HIPAA compliance
- SOC 2 standards

## Security Scanning

```bash
# Run security scan
tfsec .

# Run compliance check
checkov -d .
```
EOF

echo -e "${GREEN}✓${NC} Created docs/security.md"

echo ""
echo -e "${GREEN}✨ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Copy your prepared files (main.tf, variables.tf, etc.) to this directory"
echo "2. Update terraform.tfvars.example and copy to terraform.tfvars"
echo "3. Initialize Terraform: terraform init"
echo "4. Validate configuration: terraform validate"
echo "5. Commit and push to GitHub"
echo ""
echo -e "${BLUE}📁 Directory structure created successfully!${NC}"
echo ""
echo "Happy coding! 🚀"