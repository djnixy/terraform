output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

# output "security_group_arn" {
#   description = "The ARN of the security group"
#   value       = module.http_sg.security_group_arn
# }

output "aws_region" {
  value = data.aws_region.current
}

# output "security_group_id" {
#   description = "The ID of the security group"
#   value       = module.alb-sg.security_group_id
# }

# output "security_group_vpc_id" {
#   description = "The VPC ID"
#   value       = module.http_sg.security_group_vpc_id
# }

# output "security_group_owner_id" {
#   description = "The owner ID"
#   value       = module.http_sg.security_group_owner_id
# }

# output "security_group_name" {
#   description = "The name of the security group"
#   value       = module.http_sg.security_group_name
# }

# output "security_group_description" {
#   description = "The description of the security group"
#   value       = module.http_sg.security_group_description
# }

########################
# ALB
########################

# output "lb_id" {
#   description = "The ID and ARN of the load balancer we created."
#   value       = module.alb.lb_id
# }

# output "lb_arn" {
#   description = "The ID and ARN of the load balancer we created."
#   value       = module.alb.lb_arn
# }

# output "lb_dns_name" {
#   description = "The DNS name of the load balancer."
#   value       = module.alb.lb_dns_name
# }

# output "lb_arn_suffix" {
#   description = "ARN suffix of our load balancer - can be used with CloudWatch."
#   value       = module.alb.lb_arn_suffix
# }

# output "lb_zone_id" {
#   description = "The zone_id of the load balancer to assist with creating DNS records."
#   value       = module.alb.lb_zone_id
# }

# output "http_tcp_listener_arns" {
#   description = "The ARN of the TCP and HTTP load balancer listeners created."
#   value       = module.alb.http_tcp_listener_arns
# }

# output "http_tcp_listener_ids" {
#   description = "The IDs of the TCP and HTTP load balancer listeners created."
#   value       = module.alb.http_tcp_listener_ids
# }

# output "https_listener_arns" {
#   description = "The ARNs of the HTTPS load balancer listeners created."
#   value       = module.alb.https_listener_arns
# }

# output "https_listener_ids" {
#   description = "The IDs of the load balancer listeners created."
#   value       = module.alb.https_listener_ids
# }

# output "target_group_arns" {
#   description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
#   value       = module.alb.target_group_arns
# }

# output "target_group_arn_suffixes" {
#   description = "ARN suffixes of our target groups - can be used with CloudWatch."
#   value       = module.alb.target_group_arn_suffixes
# }

# output "target_group_names" {
#   description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
#   value       = module.alb.target_group_names
# }

# output "target_group_attachments" {
#   description = "ARNs of the target group attachment IDs."
#   value       = module.alb.target_group_attachments
# }


# output "rds" {
#   description = "DB instance address"
#   value       = module.rds.db_instance_address
# }

# output "db_instance_master_user_secret_arn" {
#   description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
#   value       = module.rds.db_instance_master_user_secret_arn
# }