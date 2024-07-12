provider "aws" {
    region = "us-west-2"
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
}

module "ec2" {
    source = "./modules/ec2"
    ec2_instance_type = var.ec2_instance_type
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.private_subnet_id
}

module "rds" {
    source = "./modules/rds"
    rds_username = var.rds_username
    rds_password = var.rds_password
    rds_instance_type = var.rds_instance_type
    subnet_id = module.vpc.private_subnet_id
    vpc_security_group_id = module.ec2.security_group_id
}