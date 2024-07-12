resource "aws_iam_role" "lambda" {
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Action = "sts:AssumeRole"
            Principal = {
              Service = "lambda.amazonaws.com"
            }
            Effect = "Allow"
          }
        ]
      })
    description = "IAM role for Lambda"
    name = "lambda-role"
}

resource "aws_iam_policy" "lambda" {
    description = "IAM policy for Lambda"
    name = "lambda-policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
          {
            Action = [
              "rds:DescribeDBInstances",
              "rds:DescribeDBClusters"
            ]
            Resource = [
              aws_db_instance.this.arn
            ]
            Effect = "Allow"
          }
        ]
      })
}

resource "aws_iam_role_policy_attachment" "lambda" {
    policy_arn = aws_iam_policy.lambda.arn
    role = aws_iam_role.lambda.name
}

resource "aws_lambda_function" "this" {
    filename = "lambda_function_payload.zip"
    function_name = var.lambda_function_name
    handler = "index.handler"
    role = aws_iam_role.lambda.arn
    runtime = "nodejs14.x"
}
