# ==================== General Variables ====================
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "multicloud-infra"
}

variable "environment" {
  description = "Environment name (dev, staging, production)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Environment must be dev, staging, or production."
  }
}

variable "owner_email" {
  description = "Email of the infrastructure owner"
  type        = string
}

variable "enable_monitoring" {
  description = "Enable monitoring stack (Prometheus, Grafana)"
  type        = bool
  default     = true
}

variable "alert_email" {
  description = "Email for receiving alerts"
  type        = string
}

# ==================== AWS Variables ====================
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-1"
}

variable "aws_vpc_cidr" {
  description = "CIDR block for AWS VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "aws_public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "aws_private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "aws_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "aws_node_count" {
  description = "Number of worker nodes in EKS cluster"
  type        = number
  default     = 3
  validation {
    condition     = var.aws_node_count >= 2 && var.aws_node_count <= 10
    error_message = "Node count must be between 2 and 10."
  }
}

variable "aws_db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "appdb"
}

variable "aws_db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "dbadmin"
  sensitive   = true
}

variable "aws_db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.medium"
}

variable "aws_db_allocated_storage" {
  description = "Allocated storage in GB for RDS"
  type        = number
  default     = 100
}

variable "aws_db_multi_az" {
  description = "Enable Multi-AZ for RDS"
  type        = bool
  default     = true
}

# ==================== Azure Variables ====================
variable "azure_location" {
  description = "Azure region for resources"
  type        = string
  default     = "West Europe"
}

variable "azure_vnet_address_space" {
  description = "Address space for Azure VNet"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "azure_subnet_prefixes" {
  description = "Subnet prefixes for Azure"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "azure_vm_size" {
  description = "Azure VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}

variable "azure_node_count" {
  description = "Number of nodes in AKS cluster"
  type        = number
  default     = 3
}

variable "azure_db_name" {
  description = "Name of Azure SQL database"
  type        = string
  default     = "appdb"
}

variable "azure_db_username" {
  description = "Admin username for Azure SQL"
  type        = string
  default     = "sqladmin"
  sensitive   = true
}

variable "azure_db_sku" {
  description = "SKU for Azure SQL Database"
  type        = string
  default     = "S0"
}

# ==================== GCP Variables ====================
variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region for resources"
  type        = string
  default     = "europe-west1"
}

variable "gcp_subnet_cidr" {
  description = "CIDR block for GCP subnet"
  type        = string
  default     = "10.2.0.0/24"
}

variable "gcp_machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "gcp_node_count" {
  description = "Number of nodes in GKE cluster"
  type        = number
  default     = 3
}

variable "gcp_db_name" {
  description = "Name of Cloud SQL database"
  type        = string
  default     = "appdb"
}

variable "gcp_db_version" {
  description = "Database version for Cloud SQL"
  type        = string
  default     = "POSTGRES_14"
}

variable "gcp_db_tier" {
  description = "Machine tier for Cloud SQL"
  type        = string
  default     = "db-f1-micro"
}

# ==================== Monitoring Variables ====================
variable "grafana_admin_password" {
  description = "Admin password for Grafana"
  type        = string
  sensitive   = true
}

variable "prometheus_retention_days" {
  description = "Data retention period for Prometheus in days"
  type        = number
  default     = 15
  validation {
    condition     = var.prometheus_retention_days >= 7 && var.prometheus_retention_days <= 90
    error_message = "Retention period must be between 7 and 90 days."
  }
}

# ==================== Tags ====================
variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Project     = "MultiCloud Infrastructure"
    ManagedBy   = "Terraform"
  }
}