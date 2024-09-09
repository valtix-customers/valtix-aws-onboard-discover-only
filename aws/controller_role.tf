# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS IAM Role for the Valtix Controller related to orchestration
# Used to allow the Valtix Controller to communicate with the AWS Account
resource "aws_iam_role" "valtix_controller_role" {
  name = var.aws_valtix_controller_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          AWS = [
            "arn:aws:iam::${var.aws_valtix_controller_account}:root"
          ]
        },
        Effect = "Allow",
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.aws_valtix_external_id
          }
        }
      }
    ]
  })
}

# AWS IAM Role Policy for the Valtix Controller related to discovery (traffic, assets)
# The IAM Role policy that defines the permissions for the Valtix Controller
resource "aws_iam_role_policy" "valtix_controller_policy" {
  name = var.aws_valtix_controller_policy
  role = aws_iam_role.valtix_controller_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "acm:DescribeCertificate",
          "acm:ListCertificates",
          "apigateway:GET",
          "ec2:Describe*",
          "ec2:Get*",
          "ec2:*Tags",
          "ec2:*FlowLogs",
          "elasticloadbalancing:Describe*",
          "events:PutRule",
          "events:PutTargets",
          "events:ListTargetsByRule",
          "globalaccelerator:Describe*",
          "iam:ListPolicies",
          "iam:ListRoles",
          "iam:ListRoleTags",
          "logs:*LogDelivery",
          "route53resolver:Get*",
          "route53resolver:List*",
          "route53resolver:*Resolver*",
          "servicequotas:GetServiceQuota",
          "s3:ListAllMyBuckets",
          "s3:ListBucket",
          "wafv2:Get*",
          "wafv2:List*"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:ListRolePolicies",
        ],
        Effect = "Allow",
        Resource = [
          aws_iam_role.valtix_controller_role.arn,
          aws_iam_role.valtix_inventory_role.arn
        ]
      },
      {
        Action = [
          "iam:PassRole"
        ],
        Effect = "Allow",
        Resource = [
          aws_iam_role.valtix_inventory_role.arn
        ]
      },
      {
        Action   = "iam:CreateServiceLinkedRole",
        Effect   = "Allow",
        Resource = "arn:aws:iam::*:role/aws-service-role/*"
      }
    ]
  })
}

# AWS IAM Role Policy for the S3 Bucket
# The IAM Role policy that defines the permissions for the S3 bucket
resource "aws_iam_role_policy" "valtix_s3_get_object" {
  name     = var.aws_valtix_s3_policy
  role     = aws_iam_role.valtix_controller_role.id
  depends_on = [
    aws_s3_bucket.valtix_s3_bucket
  ]

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject"
        ],
        Effect = "Allow",
        Resource = [
          "${aws_s3_bucket.valtix_s3_bucket.arn}/*"
        ]
      }
    ]
  })
}