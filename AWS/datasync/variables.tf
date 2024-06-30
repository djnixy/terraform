data "aws_caller_identity" "current" {}
variable "deployRegion" {}
# variable "aws_access_key_id" {}
# variable "aws_secret_access_key" {}
variable "product_name" {}
variable "environment" {
    validation {
    condition = anytrue([
      var.environment == "development",
      var.environment == "staging",
      var.environment == "production"
    ])
    error_message = "Acceptable values are [development, staging, production]"
  }
}


# variable "odooDatabase" {}
# variable "odooAdminPassword" {}
# variable "odooEnvironment" {}

# variable "s3bucket" {}
# variable "snsEndpointEmail" {}
# variable "eventDescription" {}
# variable "schedule_expression" {}
# variable "vpc_id" {}
# variable "subnet_id1" {}
# variable "subnet_id2" {}

variable "app_count" {
  type = number
  default = 1
}


locals {
  lambda_function_name      = join("-", ["lambda", var.product_name])
  aws_cloudwatch_event_rule = var.product_name
  sns_name                  = var.product_name
  datasync_sg_name  = join("-", ["lambda", var.product_name])
}