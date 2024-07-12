provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source       = "./modules/vpc"
  cidr_block   = var.vpc_cidr_block
  public_cidr  = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr
}

module "ec2" {
  source               = "./modules/ec2"
  vpc_id               = module.vpc.vpc_id
  private_subnet_id    = module.vpc.private_subnet_id
  iam_role_name        = aws_iam_role.ec2_role.name
  security_group_id    = module.vpc.ec2_security_group_id
  ami_id               = var.ec2_ami_id
  instance_type        = var.ec2_instance_type
}

module "rds" {
  source               = "./modules/rds"
  vpc_id               = module.vpc.vpc_id
  private_subnet_id    = module.vpc.private_subnet_id
  security_group_id    = module.vpc.rds_security_group_id
  db_name              = var.rds_db_name
  db_username          = var.rds_db_username
  db_password          = var.rds_db_password
}

module "s3" {
  source               = "./modules/s3"
  bucket_name          = var.s3_bucket_name
}

module "lambda" {
  source               = "./modules/lambda"
  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.vpc.private_subnet_ids
  security_group_ids   = [module.vpc.lambda_security_group_id]
  db_username          = var.rds_db_username
  db_password          = var.rds_db_password
  db_host              = module.rds.db_endpoint
  db_name              = var.rds_db_name
  lambda_s3_bucket     = module.s3.bucket_name
}

module "api_gateway" {
  source               = "./modules/api_gateway"
  lambda_function_arn  = module.lambda.lambda_arn
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "ec2_role_policy" {
  name   = "ec2_role_policy"
  role   = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = "s3:GetObject",
      Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
    }]
  })
}

output "ec2_public_ip" {
  value = module.ec2.instance_public_ip
}
