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
