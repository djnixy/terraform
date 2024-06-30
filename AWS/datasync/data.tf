data "aws_region" "current" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

# data "external" "myipaddr" {
#   program = ["bash", "-c", "curl -s 'https://ipinfo.io/json'"]
# }

# output "my_public_ip" {
#   value = "${data.external.myipaddr.result.ip}"
# }


# data "aws_lb" "alb" {
#     name = var.existing_alb_name

# }

# data "aws_ecs_cluster" "ecs-cluster" {
#   cluster_name = var.existing_ecs_cluster_name
# }

# data "aws_security_group" "alb-security-group" {
#   id = var.existing_alb_securitygroup_id
# }

# data "aws_lb_listener" "listener" {
#   arn = var.listener_arn
# }

#OUTPUT
# output "alb_name" {
#   value = data.aws_lb.alb.name
# }

# output "alb_arn" {
#   value = data.aws_lb.alb.arn
# }

