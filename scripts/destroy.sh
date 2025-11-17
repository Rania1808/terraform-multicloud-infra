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
