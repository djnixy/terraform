module "datasync-sg" {
    source  = "terraform-aws-modules/security-group/aws"

    vpc_id          = data.aws_vpc.default.id
    name            = local.datasync_sg_name
    use_name_prefix = false
    description     = "Security group for AWS DataSync"
    egress_rules    = ["all-all"]
}
    
resource "aws_datasync_location_s3" "example" {
  s3_bucket_arn = aws_s3_bucket.example.arn
  subdirectory  = "/example/prefix"

  s3_config {
    bucket_access_role_arn = aws_iam_role.example.arn
  }
}

resource "aws_datasync_location_efs" "example" {
  # The below example uses aws_efs_mount_target as a reference to ensure a mount target already exists when resource creation occurs.
  # You can accomplish the same behavior with depends_on or an aws_efs_mount_target data source reference.
  efs_file_system_arn = aws_efs_mount_target.example.file_system_arn

  ec2_config {
    security_group_arns = [aws_security_group.example.arn]
    subnet_arn          = aws_subnet.example.arn
  }
}


resource "aws_datasync_task" "example" {
  destination_location_arn = aws_datasync_location_s3.destination.arn
  name                     = "example"
  source_location_arn      = aws_datasync_location_nfs.source.arn

  options {
    bytes_per_second = -1
  }
}