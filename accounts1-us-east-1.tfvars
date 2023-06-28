# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS Settings
# aws_account_name:
  # Name of the AWS Account Name used to define the Terraform Workspace to
  # prepare for onboarding into Valtix
# aws_account_number:
  # Account Number of the AWS Account used to prepare for onboarding into Valtix
# aws_account_region:
  # Name of the AWS Region used to prepare for onboarding into Valtix
# aws_valtix_s3_bucket:
  # Name of the S3 bucket that will be used by Valtix for inventory and
  # traffic discovery.  This needs to be globally unique.
# aws_s3_object_duration:
  # Number of days to retain data stored in the S3 bucket
# aws_valtix_deploy_name:
  # The Valtix deployment name used to define policy relationships between
  # the AWS Account and the Valtix Controller
# aws_valtix_controller_account:
  # The Valtix Controller AWS Account Number used to define policy relationship
  # between the AWS Account and the Valtix Controller Account
# aws_valtix_controller_role:
  # Name for the Valtix Controller AWS IAM Role
# aws_valtix_firewall_role:
  # Name for the Valtix Firewall (Gateway) AWS IAM Role
# aws_valtix_inventory_role:
  # Name for the Valtix Inventory AWS IAM Role
# aws_valtix_cloudtrail:
  # Name for the Valtix AWS CloudTrail
# aws_valtix_controller_policy:
  # Name for the Valtix Controller AWS IAM Role Policy
# aws_valtix_s3_policy:
  # Name of the Valtix S3 AWS IAM Role Policy
aws_account_name              = "account1-us-east-1"
aws_account_number            = "765228719929"
aws_account_region            = "us-east-1"
aws_valtix_s3_bucket          = "account1-us-east-1-valtix"
aws_valtix_s3_object_duration = 1
aws_valtix_deployment_name    = "prod1"
aws_valtix_controller_account = "425355469185"
aws_valtix_controller_role    = "valtix-controller-role"
aws_valtix_inventory_role     = "valtix-inventory-role"
aws_valtix_cloudtrail         = "valtix-cloudtrail"
aws_valtix_controller_policy  = "valtix-controller-policy"
aws_valtix_s3_policy          = "valtix-s3-policy"

# Valtix Settings
# valtix_aws_account_name
  # Name to be used for the Valtix AWS Account friendly name
# valtix_api_key_file:
  # The Valtix API Key to authorize using the Valtix Terraform Provider
# valtix_aws_inventory_regions:
  # List of AWS Regions to enable in Valtix for inventory discovery
valtix_aws_account_name       = "account1"
valtix_api_key_file           = "valtix_api_key.json"
valtix_aws_inventory_regions  = [
  "us-east-1"
]