    data "http" "myip" {
      url = "https://ifconfig.me/ip"
    }

    data "aws_region" "current" {}

    ## VPC
    data "aws_vpc" "default" {
      default = true
    }

    data "aws_subnet" "zone-a" {
      vpc_id = data.aws_vpc.default.id
      filter {
        name   = "availability-zone"
        values = ["${var.deployRegion}a"]
      }
    }

    data "aws_subnet" "zone-b" {
      vpc_id = data.aws_vpc.default.id
      filter {
        name   = "availability-zone"
        values = ["${var.deployRegion}b"]
      }
    }

    output "subnet_id_az_a" {
      value = data.aws_subnet.zone-a.id
    }

    output "subnet_id_az_b" {
      value = data.aws_subnet.zone-b.id
    }
    