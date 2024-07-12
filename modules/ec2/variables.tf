variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "private_subnet_id" {
  description = "Private subnet ID"
}

variable "iam_role_name" {
  description = "IAM role name for the EC2 instance"
}

variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
}
