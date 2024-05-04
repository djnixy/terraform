
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
