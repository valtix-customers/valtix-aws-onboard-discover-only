# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS Account Number
variable "aws_account_number" {
  description = "Number of the AWS Account"
  default     = ""
  type        = string
}

# AWS Account Region
variable "aws_account_region" {
  description = "Region for the AWS Account"
  default     = ""
  type        = string
}

# AWS Valtix S3 Bucket Name
variable "aws_valtix_s3_bucket" {
  description = "Create S3 Bucket to store CloudTrail, Route53 Query Logs and VPC Flow Logs"
  default     = ""
  type        = string
}

# AWS Valtix S3 Bucket Object Duration
variable "aws_valtix_s3_object_duration" {
  description = "Duration (in days) after which the objects in the S3 Bucket are deleted"
  default     = 1
  type        = number
}

# AWS Valtix Deployment Name
variable "aws_valtix_deployment_name" {
  description = "Name of the Valtix Controller deployment"
  default     = "prod1"
  type        = string
}

# AWS Valtix Controller AWS Account Number
variable "aws_valtix_controller_account" {
  description = "AWS account number of the Valtix Controller"
  default     = "425355469185"
  type        = string
}

# AWS Valtix Controller IAM Role Name
variable "aws_valtix_controller_role" {
  description = "AWS IAM name for the Valtix Controller Role"
  default     = "valtix-controller-role"
  type        = string
}

# AWS Valtix Inventory IAM Role Name
variable "aws_valtix_inventory_role" {
  description = "AWS IAM name for the Valtix Inventory Role"
  default     = "valtix-inventory-role"
  type        = string
}

# AWS Valtix CloudTrail Name
variable "aws_valtix_cloudtrail" {
  description = "AWS CloudTrail name for the Valtix CloudTrail"
  default     = "valtix-cloudtrail"
  type        = string
}

# AWS Valtix Controller IAM Policy Name
variable "aws_valtix_controller_policy" {
  description = "AWS IAM Policy name for the Valtix Controller Role"
  default     = "valtix-controller-policy"
  type        = string
}

# AWS Valtix S3 Bucket IAM Policy Name
variable "aws_valtix_s3_policy" {
  description = "AWS IAM Policy name for the Valtix S3 Bucket"
  default     = "valtix-s3-policy"
  type        = string
}

# AWS Valtix External ID
variable "aws_valtix_external_id" {
  description = "Valtix External ID to be used as a Trust Relationship between Valtix Controller and AWS"
  default     = ""
  type        = string
}