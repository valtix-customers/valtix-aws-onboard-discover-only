# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Terraform Workspace Check
data "local_file" "workspace_check" {
  count    = var.aws_account_name == terraform.workspace ? 0 : 1
  filename = "ERROR: Terraform Workspace does not match the name provided: terraform workspace create <workspacename>"
}

# AWS S3 Bucket, IAM Roles and Policies, and CloudTrail
module "aws" {
  aws_account_number            = var.aws_account_number
  aws_account_region            = var.aws_account_region
  aws_valtix_s3_bucket          = var.aws_valtix_s3_bucket
  aws_valtix_s3_object_duration = var.aws_valtix_s3_object_duration
  aws_valtix_deployment_name    = var.aws_valtix_deployment_name
  aws_valtix_controller_account = var.aws_valtix_controller_account
  aws_valtix_controller_role    = var.aws_valtix_controller_role
  aws_valtix_inventory_role     = var.aws_valtix_inventory_role
  aws_valtix_cloudtrail         = var.aws_valtix_cloudtrail
  aws_valtix_controller_policy  = var.aws_valtix_controller_policy
  aws_valtix_s3_policy          = var.aws_valtix_s3_policy
  aws_valtix_external_id        = module.valtix.valtix_external_id
  source                        = "./aws"
}

# Valtix Cloud Account
module "valtix" {
  aws_account_number             = var.aws_account_number
  aws_valtix_controller_role_arn = module.aws.valtix_controller_role_arn
  aws_valtix_inventory_role_arn  = module.aws.valtix_inventory_role_arn
  valtix_aws_account_name        = var.valtix_aws_account_name
  valtix_aws_inventory_regions   = var.valtix_aws_inventory_regions
  source                         = "./valtix"
}