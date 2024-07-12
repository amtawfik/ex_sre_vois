variable "rds_username" {
    default = "mydbuser"
    type = string
}

variable "rds_password" {
    default = "123"
    type = string
}

variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
    type = string
}

variable "rds_instance_type" {
    default = "db.t2.micro"
    type = string
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
}

variable "ec2_instance_type" {
    default = "t2.micro"
    type = string
}

variable "api_gateway_name" {
    default = "my-api-gateway"
    type = string
}

variable "domain_name" {
    default = "example.com"
    type = string
}

variable "lambda_function_name" {
    default = "my-lambda-function"
    type = string
}

variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
    type = string
}

variable "s3_bucket_name" {
    default = "my-s3-bucket-amtawfik-sre"
    type = string
}
