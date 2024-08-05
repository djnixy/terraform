

data "aws_caller_identity" "current" {}
data "http" "myip" {
  url = "https://ifconfig.me/ip"
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

data "aws_ami" "eks_default_bottlerocket" {
  most_recent = true
  owners      = ["602401143452"] # AWS account ID for EKS
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]  # Use a broader pattern
  }
}

data "aws_ami" "eks_default_arm" {
  most_recent = true
  owners      = ["602401143452"]
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"] # Update if necessary
  }
}


data "aws_ami" "eks_default" {
  most_recent = true
  owners      = ["602401143452"]
  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }
}
