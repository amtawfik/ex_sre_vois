variable "private_subnet_ids" {
  description = "Private subnet IDs for Lambda"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs for Lambda"
  type        = list(string)
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "db_host" {
  description = "Database endpoint"
}

variable "db_name" {
  description = "Database name"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket for Lambda"
}
