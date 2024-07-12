--resource "aws_db_subnet_group" "this" {
    description = "RDS subnet group"
    name = "rds-subnet-group"
    subnet_ids = [
        aws_subnet.private.id,
    ]
}


resource "aws_db_instance" "this" {
    db_subnet_group_name = aws_db_subnet_group.this.name
    engine = "postgres"
    instance_class = var.rds_instance_type
    password = var.rds_password
    username = var.rds_username
    vpc_security_group_ids = [var.vpc_security_group_id]
}

output "db_instance_endpoint" {
    value = aws_db_instance.this.endpoint
}
