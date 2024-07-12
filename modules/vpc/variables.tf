variable "cidr_block" {
  description = "The CIDR block for the VPC"
  value = "10.0.0.0/16"
}

variable "public_cidr" {
  description = "The CIDR block for the public subnet"
  value = "10.0.1.0/24"
}

variable "private_cidr" {
  description = "The CIDR block for the private subnet"
  value = "10.0.2.0/24"
}
