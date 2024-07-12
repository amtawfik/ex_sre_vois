resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t2.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.security_group_id]

  storage_encrypted    = true

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.private_subnet_id]

  tags = {
    Name = "Main subnet group"
  }
}
