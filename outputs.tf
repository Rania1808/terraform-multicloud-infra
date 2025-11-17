# ==================== AWS Outputs ====================
output "aws_vpc_id" {
  description = "ID of the AWS VPC"
  value       = module.aws_networking.vpc_id
}

output "aws_eks_cluster_endpoint" {
  description = "Endpoint for AWS EKS cluster"
  value       = module.aws_compute.cluster_endpoint
  sensitive   = true
}

output "aws_eks_cluster_name" {
  description = "Name of the AWS EKS cluster"
  value       = module.aws_compute.cluster_name
}

output "aws_rds_endpoint" {
  description = "Connection endpoint for AWS RDS"
  value       = module.aws_database.db_endpoint
  sensitive   = true
}

output "aws_s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.aws_database.s3_bucket_name
}

output "aws_cloudwatch_log_group" {
  description = "CloudWatch log group name"
  value       = module.aws_monitoring.log_group_name
}

# ==================== Azure Outputs ====================
output "azure_resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = module.azure_networking.resource_group_name
}

output "azure_vnet_id" {
  description = "ID of the Azure Virtual Network"
  value       = module.azure_networking.vnet_id
}

output "azure_aks_cluster_name" {
  description = "Name of the Azure AKS cluster"
  value       = module.azure_compute.cluster_name
}

output "azure_aks_kube_config" {
  description = "Kube config for Azure AKS cluster"
  value       = module.azure_compute.kube_config
  sensitive   = true
}

output "azure_sql_server_fqdn" {
  description = "Fully qualified domain name of Azure SQL Server"
  value       = module.azure_database.sql_server_fqdn
  sensitive   = true
}

output "azure_log_analytics_workspace_id" {
  description = "ID of Azure Log Analytics Workspace"
  value       = module.azure_monitoring.workspace_id
}

# ==================== GCP Outputs ====================
output "gcp_network_name" {
  description = "Name of the GCP VPC network"
  value       = module.gcp_networking.network_name
}

output "gcp_gke_cluster_name" {
  description = "Name of the GCP GKE cluster"
  value       = module.gcp_compute.cluster_name
}

output "gcp_gke_cluster_endpoint" {
  description = "Endpoint for GCP GKE cluster"
  value       = module.gcp_compute.cluster_endpoint
  sensitive   = true
}

output "gcp_sql_instance_connection_name" {
  description = "Connection name for Cloud SQL instance"
  value       = module.gcp_database.instance_connection_name
  sensitive   = true
}

output "gcp_storage_bucket_name" {
  description = "Name of the GCS bucket"
  value       = module.gcp_database.bucket_name
}

# ==================== Monitoring Outputs ====================
output "grafana_url" {
  description = "URL to access Grafana dashboard"
  value       = module.centralized_monitoring.grafana_url
}

output "prometheus_url" {
  description = "URL to access Prometheus"
  value       = module.centralized_monitoring.prometheus_url
}

output "kibana_url" {
  description = "URL to access Kibana"
  value       = module.centralized_monitoring.kibana_url
}

# ==================== Summary Output ====================
output "deployment_summary" {
  description = "Summary of deployed infrastructure"
  value = {
    environment = var.environment
    project     = var.project_name
    aws = {
      region       = var.aws_region
      cluster_name = module.aws_compute.cluster_name
      vpc_id       = module.aws_networking.vpc_id
    }
    azure = {
      location      = var.azure_location
      cluster_name  = module.azure_compute.cluster_name
      resource_group = module.azure_networking.resource_group_name
    }
    gcp = {
      region       = var.gcp_region
      project_id   = var.gcp_project_id
      cluster_name = module.gcp_compute.cluster_name
    }
    monitoring = {
      enabled      = var.enable_monitoring
      grafana_url  = module.centralized_monitoring.grafana_url
    }
  }
}

# ==================== Kubernetes Config Commands ====================
output "kubectl_config_commands" {
  description = "Commands to configure kubectl for each cluster"
  value = {
    aws = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.aws_compute.cluster_name}"
    azure = "az aks get-credentials --resource-group ${module.azure_networking.resource_group_name} --name ${module.azure_compute.cluster_name}"
    gcp = "gcloud container clusters get-credentials ${module.gcp_compute.cluster_name} --region ${var.gcp_region} --project ${var.gcp_project_id}"
  }
}

# ==================== Database Connection Strings ====================
output "database_connection_info" {
  description = "Database connection information (sensitive)"
  value = {
    aws_rds = {
      endpoint = module.aws_database.db_endpoint
      port     = 5432
      database = var.aws_db_name
    }
    azure_sql = {
      server   = module.azure_database.sql_server_fqdn
      port     = 1433
      database = var.azure_db_name
    }
    gcp_cloud_sql = {
      connection_name = module.gcp_database.instance_connection_name
      database        = var.gcp_db_name
    }
  }
  sensitive = true
}