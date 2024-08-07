
    output "account_id" {
      value = data.aws_caller_identity.current.account_id
    }

    output "caller_arn" {
      value = data.aws_caller_identity.current.arn
    }

    output "caller_user" {
      value = data.aws_caller_identity.current.user_id
    }

    output "aws_region" {
      value = data.aws_region.current
    }

    output "ec2_instance_ip" {
      value = module.ec2-instance.public_ip
    }

