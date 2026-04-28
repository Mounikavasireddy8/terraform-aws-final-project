locals {
  environment = terraform.workspace

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Owner       = "Mounika Vasireddy"
  }

  name_prefix = "${var.project_name}-${local.environment}"
  ecr_image   = "${var.account_id}.dkr.ecr.${var.aws_region}.amazonaws.com/cloudops-dashboard:v1"
}