resource "aws_security_group" "ec2" {
    description = "Security group for EC2"
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        protocol = "tcp"
        to_port = 22
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        protocol = "tcp"
        to_port = 80
    }
    name = "ec2-sg"
    vpc_id = var.vpc_id
}

resource "aws_instance" "myinst" {
    ami = "ami-0aff18ec83b712f05"
    instance_type = var.ec2_instance_type
    key_name = "my-key-pair"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2.id]
}

output "instance_id" {
    value = aws_instance.myinst.id
}

output "security_group_id" {
    value = aws_security_group.ec2.id
}
