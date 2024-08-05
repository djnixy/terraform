locals {
  region = "ap-southeast-1"
  product_name = "eks-terraform-cluster"
  vpc_cidr = "10.123.0.0/16"
  azs      = ["ap-southeast-1a", "ap-southeast-1b"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]
  tags = {
    Example = local.product_name
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
