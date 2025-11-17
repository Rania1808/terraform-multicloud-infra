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
