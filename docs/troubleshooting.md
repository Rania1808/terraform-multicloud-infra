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
