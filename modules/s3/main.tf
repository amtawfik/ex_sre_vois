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
