resource "aws_instance" "ec2_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.instance_key_name
  vpc_security_group_ids = var.instance_security_group_id
  subnet_id     = var.instance_subnet_id
  user_data = base64encode(var.user_data)
  tags = var.tags
}