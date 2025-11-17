terraform {
  required_version = ">= 1.6.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-multicloud-infra"
    key            = "global/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

# ==================== AWS Provider ====================
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = var.owner_email
    }
  }
}

# ==================== Azure Provider ====================
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

# ==================== GCP Provider ====================
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# ==================== AWS Infrastructure ====================
module "aws_networking" {
  source = "./modules/aws/networking"

  vpc_cidr             = var.aws_vpc_cidr
  availability_zones   = var.aws_availability_zones
  public_subnet_cidrs  = var.aws_public_subnet_cidrs
  private_subnet_cidrs = var.aws_private_subnet_cidrs
  environment          = var.environment
  project_name         = var.project_name
}

module "aws_compute" {
  source = "./modules/aws/compute"

  vpc_id              = module.aws_networking.vpc_id
  private_subnet_ids  = module.aws_networking.private_subnet_ids
  public_subnet_ids   = module.aws_networking.public_subnet_ids
  instance_type       = var.aws_instance_type
  cluster_name        = "${var.project_name}-${var.environment}-eks"
  node_count          = var.aws_node_count
  environment         = var.environment
}

module "aws_database" {
  source = "./modules/aws/database"

  vpc_id             = module.aws_networking.vpc_id
  private_subnet_ids = module.aws_networking.private_subnet_ids
  db_name            = var.aws_db_name
  db_username        = var.aws_db_username
  instance_class     = var.aws_db_instance_class
  allocated_storage  = var.aws_db_allocated_storage
  multi_az           = var.aws_db_multi_az
  environment        = var.environment
}

module "aws_monitoring" {
  source = "./modules/aws/monitoring"

  cluster_name = module.aws_compute.cluster_name
  environment  = var.environment
  
  enable_cloudwatch_logs    = var.enable_monitoring
  enable_prometheus         = var.enable_monitoring
  alert_email               = var.alert_email
}

# ==================== Azure Infrastructure ====================
module "azure_networking" {
  source = "./modules/azure/networking"

  location            = var.azure_location
  resource_group_name = "${var.project_name}-${var.environment}-rg"
  vnet_address_space  = var.azure_vnet_address_space
  subnet_prefixes     = var.azure_subnet_prefixes
  environment         = var.environment
  project_name        = var.project_name
}

module "azure_compute" {
  source = "./modules/azure/compute"

  location              = var.azure_location
  resource_group_name   = module.azure_networking.resource_group_name
  vnet_id               = module.azure_networking.vnet_id
  subnet_id             = module.azure_networking.subnet_ids[0]
  vm_size               = var.azure_vm_size
  cluster_name          = "${var.project_name}-${var.environment}-aks"
  node_count            = var.azure_node_count
  environment           = var.environment
}

module "azure_database" {
  source = "./modules/azure/database"

  location              = var.azure_location
  resource_group_name   = module.azure_networking.resource_group_name
  subnet_id             = module.azure_networking.subnet_ids[1]
  server_name           = "${var.project_name}-${var.environment}-sqlserver"
  database_name         = var.azure_db_name
  admin_username        = var.azure_db_username
  sku_name              = var.azure_db_sku
  environment           = var.environment
}

module "azure_monitoring" {
  source = "./modules/azure/monitoring"

  location            = var.azure_location
  resource_group_name = module.azure_networking.resource_group_name
  cluster_id          = module.azure_compute.cluster_id
  environment         = var.environment
  
  enable_log_analytics = var.enable_monitoring
  alert_email          = var.alert_email
}

# ==================== GCP Infrastructure ====================
module "gcp_networking" {
  source = "./modules/gcp/networking"

  project_id      = var.gcp_project_id
  region          = var.gcp_region
  network_name    = "${var.project_name}-${var.environment}-network"
  subnet_cidr     = var.gcp_subnet_cidr
  environment     = var.environment
  project_name    = var.project_name
}

module "gcp_compute" {
  source = "./modules/gcp/compute"

  project_id     = var.gcp_project_id
  region         = var.gcp_region
  network_name   = module.gcp_networking.network_name
  subnet_name    = module.gcp_networking.subnet_name
  cluster_name   = "${var.project_name}-${var.environment}-gke"
  machine_type   = var.gcp_machine_type
  node_count     = var.gcp_node_count
  environment    = var.environment
}

module "gcp_database" {
  source = "./modules/gcp/database"

  project_id         = var.gcp_project_id
  region             = var.gcp_region
  network_id         = module.gcp_networking.network_id
  instance_name      = "${var.project_name}-${var.environment}-sql"
  database_name      = var.gcp_db_name
  database_version   = var.gcp_db_version
  tier               = var.gcp_db_tier
  environment        = var.environment
}

module "gcp_monitoring" {
  source = "./modules/gcp/monitoring"

  project_id   = var.gcp_project_id
  cluster_name = module.gcp_compute.cluster_name
  environment  = var.environment
  
  enable_cloud_logging = var.enable_monitoring
  alert_email          = var.alert_email
}

# ==================== Cross-Cloud Monitoring ====================
module "centralized_monitoring" {
  source = "./modules/monitoring/centralized"

  aws_cloudwatch_log_group   = module.aws_monitoring.log_group_name
  azure_log_analytics_workspace = module.azure_monitoring.workspace_id
  gcp_logging_project        = var.gcp_project_id
  
  grafana_admin_password = var.grafana_admin_password
  prometheus_retention   = var.prometheus_retention_days
  environment            = var.environment
}