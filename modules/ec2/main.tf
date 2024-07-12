resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  vpc_security_group_ids = [
    var.security_group_id,
  ]

  tags = {
    Name = "WebServer"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = var.iam_role_name
}
