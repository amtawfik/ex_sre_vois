resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
    availability_zone = "us-west-2a"
    cidr_block = var.public_subnet_cidr
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_subnet" "private" {
    availability_zone = "us-west-2a"
    cidr_block = var.private_subnet_cidr
    vpc_id = aws_vpc.myvpc.id
}

output "vpc_id" {
    value = aws_vpc.myvpc.id
}

output "public_subnet_id" {
    value = aws_subnet.public.id
}

output "private_subnet_id" {
    value = aws_subnet.private.id
}
