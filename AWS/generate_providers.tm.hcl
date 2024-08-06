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
    region       = "ap-southeast-1"
    # profile      = "default"
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    # s3_force_path_style         = true
    access_key                  = "mock_access_key"
    secret_key                  = "mock_secret_key"

    default_tags {
        tags = {
            Environment = var.environment
            Product     = var.product_name
        }
    }
}

  }
}


