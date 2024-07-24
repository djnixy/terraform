

data "aws_caller_identity" "current" {}
data "http" "myip" {
  url = "https://ifconfig.me/ip"
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

