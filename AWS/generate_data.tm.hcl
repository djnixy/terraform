
# The backend configuration is the same in each stack, so we can generate it unconditionally

generate_hcl "_terramate_generated_data.tf" {
  content {

data "http" "myip" {
  url = "https://ifconfig.me/ip"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}
data "aws_ami" "eks_default" {}
data "aws_ami" "eks_default_bottlerocket" {}

  }
}
