resource "aws_s3_bucket" "this" {
    acl = "private"
    bucket = var.s3_bucket_name
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

resource "aws_iam_policy" "ec2" {
    description = "IAM policy for EC2"
    name = "ec2-policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Action = [
              "s3:GetObject",
              "s3:ListBucket"
            ]
            Resource = [
              "arn:aws:s3:::${var.s3_bucket_name}",
              "arn:aws:s3:::${var.s3_bucket_name}/*"
            ]
            Effect = "Allow"
          }
        ]
      })
}

resource "aws_iam_role_policy_attachment" "ec2" {
    policy_arn = aws_iam_policy.ec2.arn
    role = aws_iam_role.ec2.name
}
