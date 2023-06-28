# Onboard AWS Accounts into Valtix for Discovery Only (no orchestration)

# Authorization Requirements
1. Enable Terraform to access your AWS Account. Check here for the options https://registry.terraform.io/providers/hashicorp/aws/latest/docs
1. Login to the Valtix Dashboard and generate an API Key using the instructions provided here: https://registry.terraform.io/providers/valtix-security/valtix/latest/docs

# Terraform Configuration Requirements
1. Download and install the Terraform binary/executable provided here: https://www.terraform.io/downloads.  Be sure to add the binary/executable to your path.
1. Configure the AWS credentials for Terraform access from the  "Shared Configuration and Credentials Files" section found here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration
  1. Create the ~/.aws/config file
  1. Create a Profile for each AWS Account name
  1. Store the `aws_access_key_id` and `aws_access_key_secret` for each AWS Account in its corresponding Profile

# Terraform Repository
The Terraform repository will be supplied as a .zip file that will be provided as a download from Github.  Github will be used by Valtix means to develop the Terraform code.  In order to use the Terraform code, the .zip file will need to be zipped into a consistent directory unique to this Terraform repository.  Any updates to the Terraform will be unzipped to the same directory where the files will be replaced.  The directory will contain the Terraform State for each Terraform run, which will not be altered by any Terraform file replacement.

# Terraform Variables Configuration Requirements
The set of variables for each Profile is defined in a separate file.  The name of the file will be the AWS Account name with a .tfvars extension.  Each Profile is referenced in the shell (.sh) file, which is used to run the Terraform.

# Terraform Execution Requirements
The Terraform will be run using a shell (.sh) file called `valtix-onboard.sh`.  This file will reference the one or more Profiles, which will call the Terraform for each Profile named .tfvars file.  Arguments can be applied in the same way arguments are applied when running Terraform without the shell file.

The Shell file will create a set of Terraform Workspaces (one per Profile), and use each Workspace to perform operations on each AWS Account accordingly.  The Terraform state for each Profile will be stored in the Terraform Workspace.

In order to run Terraform on a single, subset or all Profiles, each Profile can be commented or uncommented in the shell (.sh) file accordingly.  This will not alter the Terraform State, but purely dictate what Profiles will be operated on when the shell file is executed.