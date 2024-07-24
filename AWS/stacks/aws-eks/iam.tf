
module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.41.0"
}

resource "aws_iam_policy" "additional" {
  name = "${var.product_name}-additional"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
