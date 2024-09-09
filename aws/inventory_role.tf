# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS IAM Role for the Valtix Controller related to inventory discovery
# Used to allow the Valtix Gateway to communicate with the AWS Account
resource "aws_iam_role" "valtix_inventory_role" {
  name = var.aws_valtix_inventory_role

  tags = {
    Name   = var.aws_valtix_inventory_role
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Effect = "Allow"
      }
    ]
  })
}

# AWS IAM Role Policy for the Valtix Controller related to inventory discovery
# The IAM Role policy that defines the permissions for the Valtix Controller
resource "aws_iam_role_policy" "valtix_inventory_policy" {
  name = var.aws_valtix_inventory_role
  role = aws_iam_role.valtix_inventory_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "events:PutEvents",
        Effect = "Allow",
        Resource = [
          "arn:aws:events:*:${var.aws_valtix_controller_account}:event-bus/default"
        ]
      },
      {
        Action = "events:InvokeApiDestination",
        Effect = "Allow",
        Resource = [
          "arn:aws:events:*:${var.aws_account_number}:api-destination/*"
        ]
      }
    ]
  })
}