variable "aws_region" {
  description = "The AWS region to deploy in"
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "ec2_instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "rds_db_name" {
  description = "Database name for the RDS instance"
}

variable "rds_db_username" {
  description = "Database username for the RDS instance"
}

variable "rds_db_password" {
  description = "Database password for the RDS instance"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
}
