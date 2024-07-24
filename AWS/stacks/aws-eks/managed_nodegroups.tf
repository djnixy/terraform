# generate_hcl "_terramate_generated_managed_nodegroups.tf" {
#   content {
#     module "eks_managed_node_group" {
#       source  = "terraform-aws-modules/eks/aws"

#       name            = "separate-eks-mng"
#       cluster_name    = module.eks.cluster_name
#       cluster_version = module.eks.cluster_version

#       subnet_ids                        = module.vpc.private_subnets
#       cluster_primary_security_group_id = module.eks.cluster_primary_security_group_id
#       vpc_security_group_ids = [
#         module.eks.cluster_security_group_id,
#       ]

#       ami_type = "BOTTLEROCKET_x86_64"
#       platform = "bottlerocket"

#       # this will get added to what AWS provides
#       bootstrap_extra_args = <<-EOT
#         # extra args added
#         [settings.kernel]
#         lockdown = "integrity"

#         [settings.kubernetes.node-labels]
#         "label1" = "foo"
#         "label2" = "bar"
#       EOT

#       tags = merge(local.tags, { Separate = "eks-managed-node-group" })
#     }
#   }
# }