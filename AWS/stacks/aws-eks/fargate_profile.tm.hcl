# generate_hcl "_terramate_generated_fargate_profile.tf" {
#   content {
#     module "fargate_profile" {
#       source  = "terraform-aws-modules/eks/aws"

#       # name         = "separate-fargate-profile"
#       cluster_name = module.eks.cluster_name

#       subnet_ids = module.vpc.private_subnets
#       selectors = [{
#         namespace = "kube-system"
#       }]

#       tags = merge(local.tags, { Separate = "fargate-profile" })
#     }
#   }
# }