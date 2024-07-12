output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "lambda_function_arn" {
  value = module.lambda.lambda_arn
}

output "api_gateway_endpoint" {
  value = module.api_gateway.api_endpoint
}
