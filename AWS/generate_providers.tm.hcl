generate_hcl "_terramate_generated_providers.tf" {
  content {

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
    region = "ap-southeast-1"
#     profile                  = "default"
    # access_key = var.aws_access_key_id
    # secret_key = var.aws_secret_access_key

    default_tags {
        tags = {
            Environment = var.environment
            Product     = var.product_name
        }
    }
}

  }
}

