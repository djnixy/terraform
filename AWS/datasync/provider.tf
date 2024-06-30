
provider "aws" {
    region = var.deployRegion
    profile                  = "demo"

    default_tags {
        tags = {
            Environment = var.environment
            Product     = var.product_name
        }
    }
}
