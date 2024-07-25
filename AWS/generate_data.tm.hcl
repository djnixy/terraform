
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
## VPC
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "zone-a" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "availability-zone"
    values = ["${var.deploy_region}a"]
  }
}

data "aws_subnet" "zone-b" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "availability-zone"
    values = ["${var.deploy_region}b"]
  }
}

output "subnet_id_az_a" {
  value = data.aws_subnet.zone-a.id
}

output "subnet_id_az_b" {
  value = data.aws_subnet.zone-b.id
}
    
  }
}
