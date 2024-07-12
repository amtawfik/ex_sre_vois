variable "db_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "private_subnet_id" {
  description = "Private subnet ID"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "security_group_id" {
  description = "Security group ID for RDS"
}
