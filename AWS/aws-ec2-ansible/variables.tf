
    data "aws_caller_identity" "current" {}
    # variable "aws_access_key_id" {}
    # variable "aws_secret_access_key" {}
    variable "deployRegion" {}
    # variable "product_name" {}

    variable "environment" {
      default = "sandbox"
      validation {
        condition = anytrue([
          var.environment == "development",
          var.environment == "staging",
          var.environment == "production"
        ])
        error_message = "Acceptable values are [development, staging, production]"
      }
    }
    