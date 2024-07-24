module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = "${var.product_name}-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)

  # private_subnet_names = ["private-snet-a", "private-snet-b"]
  # private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k)]

  public_subnet_names = ["public-snet-a", "public-snet-b"]
  public_subnets  = [for k, v in slice(data.aws_availability_zones.available.names, 0, 3) : cidrsubnet(var.vpc_cidr, 4, k + 2)]

  # database_subnet_names =  ["database-snet-a", "database-snet-b"]
  # database_subnets   = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k + 14)]


  # enable_nat_gateway = true
  # single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

}